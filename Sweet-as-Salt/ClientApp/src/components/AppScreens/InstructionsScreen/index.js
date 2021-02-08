import React, { Component } from 'react'
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/swiper.scss';
import instructionimg1 from 'contents/images/instructions-screen1.png';
import instructionimg2 from 'contents/images/instructions-screen2.png';
export default class InstructionsScreen extends Component {
  render() {
    return (
      <div className="sas__blankpaper">
        <div className="sas__instructions">
          <Swiper 
            spaceBetween={50}
            slidesPerView={1}
            onSlideChange={() => console.log('slide change')}
            onSwiper={(swiper) => console.log(swiper)}
            className="sas__swiper"
            watchSlidesProgress
            >
            <SwiperSlide>
              <img src={instructionimg1}  />
            </SwiperSlide>
            <SwiperSlide>
              <img src={instructionimg2} />
            </SwiperSlide>
          </Swiper>
        </div>
      </div>
    )
  }
}
