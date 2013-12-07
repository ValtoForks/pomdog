﻿//
//  Copyright (C) 2013 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#ifndef POMDOG_MOUSESTATE_8ADED430_5E85_11E3_B452_A8206655A22B_HPP
#define POMDOG_MOUSESTATE_8ADED430_5E85_11E3_B452_A8206655A22B_HPP

#if (_MSC_VER > 1000)
#	pragma once
#endif

#include "../Config/FundamentalTypes.hpp"
#include "../Math/Point2D.hpp"
#include "ButtonState.hpp"

namespace Pomdog {

/// @addtogroup Framework
/// @{
/// @addtogroup Input
/// @{

///@~Japanese
/// @brief マウスの状態を表します。
class MouseState
{
public: 
	///@~English
	/// @brief Position of the mouse cursor
	///@~Japanese
	/// @brief マウスカーソルの位置
	/// @remarks
	/// ゲームウィンドウの左上隅を基準とした位置を示します。
	/// マウスカーソルがクライアント領域外である左端、上端を越えた場合、
	/// 負の値をとることがあります。
	Point2D Position;

	///@~Japanese
	/// @brief マウススクロールホイールの移動量
	std::int32_t ScrollWheel;

	///@~English
	/// @brief Left mouse button
	///@~Japanese
	/// @brief マウス左ボタン
	ButtonState LeftButton;

	///@~English
	/// @brief Middle mouse button
	///@~Japanese
	/// @brief マウス中央ボタン
	ButtonState MiddleButton;

	///@~English
	/// @brief Right mouse button
	///@~Japanese
	/// @brief マウス右ボタン
	ButtonState RightButton;

	///@~English
	/// @brief First extended mouse button
	///@~Japanese
	/// @brief マウス拡張ボタン1
	ButtonState XButton1;

	///@~English
	/// @brief Second extended mouse button
	///@~Japanese
	/// @brief マウス拡張ボタン2
	ButtonState XButton2;
	
public:
	MouseState();
};

/// @}
/// @}

}// namespace Pomdog

#endif // !defined(POMDOG_MOUSESTATE_8ADED430_5E85_11E3_B452_A8206655A22B_HPP)