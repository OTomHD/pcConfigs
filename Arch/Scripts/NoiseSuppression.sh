#!/bin/bash
# Taken From https://github.com/werman/noise-suppression-for-voice

pipewireLocation=~/.config/pipewire/pipewire.conf.d/
confFileName=99-input-denoising.conf

sudo pacman -S noise-suppression-for-voice

mkdir -p $pipewireLocation
touch $pipewireLocation$confFileName

cat << EOT >> $pipewireLocation$confFileName
context.modules = [
{   name = libpipewire-module-filter-chain
    args = {
        node.description =  "Noise Canceling source"
        media.name =  "Noise Canceling source"
        filter.graph = {
            nodes = [
                {
                    type = ladspa
                    name = rnnoise
                    plugin = /usr/lib/ladspa/librnnoise_ladspa.so
                    label = noise_suppressor_mono
                    control = {
                        "VAD Threshold (%)" = 50.0
                        "VAD Grace Period (ms)" = 200
                        "Retroactive VAD Grace (ms)" = 0
                    }
                }
            ]
        }
        capture.props = {
            node.name =  "capture.rnnoise_source"
            node.passive = true
            audio.rate = 48000
        }
        playback.props = {
            node.name =  "rnnoise_source"
            media.class = Audio/Source
            audio.rate = 48000
        }
    }
}
]
EOT

echo You May want to restart pipewire \(systemctl restart --user pipewire\)
echo or restart your computer to make the changes
