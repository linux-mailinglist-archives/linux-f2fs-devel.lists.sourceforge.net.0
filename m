Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA02C8031F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 12:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3iA0LE5WlUt+ZubOTst3Us1jqDif7i3AhDkE7Dkyu8=; b=R7ZTLqhzjtY9V+YkUaS4H009aV
	ZMntHipbXcqij3ThJLG9lHuK86fFXd1VpnjDHZ2g5cU9bRRnPc/t7bq2ma5gU4t12PhDB4j0QpqUH
	v8arMZzYIRJ0yPO81om334GwhfbM/peziVRtRu4ToNOnAlii8jVo+rk8ul/ig8PhW3Zc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNUil-00082m-Uc;
	Mon, 24 Nov 2025 11:27:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1vNUik-00082b-Vb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 11:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=16AQkDfR7Rw51P+4aTZ0aEhaIIwHRFcFomUJ97E39h4=; b=FDsVjluOzy77vdkYEp9oluulAI
 OhVWD2krDnYArj9OeQ5r20an5VkmP6Omd+UD41g4t2XVrsRozeI3/ruOc9A6NS8G+3kYX0TgTf156
 INKfOFA94GLmWgEyAo0OmwHvQQB3PymohzZGjD3X3E2heLJX34191aVb9s2FIpeT1X/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=16AQkDfR7Rw51P+4aTZ0aEhaIIwHRFcFomUJ97E39h4=; b=CXDuyRDH6WUkQzC956z+dZnE4Z
 sJr3zH8P8iFYLGa9ULEhdTt00CsPSPC4SNvoWMe1qahM4VqTNekgc2BlLIiPFaHgdNP5DyU2DmxlP
 iVYWouxtJkHrJFSoOMmfvLQtC7nznQ8MqU6vdaNx5GOb7sGMchiecbYfzGqR5QmTcG1U=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNUil-00080B-D3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 11:27:03 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so4966545b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763983613; x=1764588413; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=16AQkDfR7Rw51P+4aTZ0aEhaIIwHRFcFomUJ97E39h4=;
 b=LBjxEAEVdwGuEl5BMDG3ECn/cxg6B1C/WcvPjUp3M+sdYrROsr7tJSwSEOdKkCjjkB
 VoPl2aZ9miEklfgkM/Teo95WuTXZxe5uDrscHjaUyfUuCUCd/wzu20COYBE/7YRjc1Mu
 tGywwFbwjj5+vPK6druGQ7sJpkM2JmmP49N/VDWgeTe2OvHd3ytVQTEYLrqEv6UvrZ43
 j3MtxC2zO+Z/vZ7HlY27G2gYPIR1OS4qA161+jxDqPrHW+RMjXCpBupzj2M34zhYeLKj
 /g2uaiF10N23Xi7ltaZFnHC101LmimbCTMRkUNmC9joOKsiY/GyjPJf5Nrp46EkoscgI
 /2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763983613; x=1764588413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16AQkDfR7Rw51P+4aTZ0aEhaIIwHRFcFomUJ97E39h4=;
 b=pfpPHNFMaXppkWQVVzoHAQhmttDa02D8FcZiUBi5mYheA8ccKNojFwAVayQw8dUd/t
 bBioC8vmzOzd9YkhxwHn9slhRK4Npcwy/qWQxPSwCaqAJkwTanIycRjwSgDwWCytrHYV
 /NpTTDoEZfC1pCZvHOc9jSFDBDW5L7tSi275rNB/NGjlsJ2xLahHaikaPwR+kJ4gqIGe
 0QX6XZxpD/rnB4xawC36ukXn43smNX2zZLz859bSFKPG1CJj54aZzgo5cdVI5rIQBY8j
 YKqMQA7X74eJ5pXi267iWd6SyOqIFjlWByAUyzgHT/oBZGRhKw0lPIWOccTMePWrr2Dn
 xPtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa97YT7EOkvi4vOsGonBAEyuLsfmf8t7gjr8201awMqVARwLz/4ERdfGh8ayQc9RgT9JUzP5zYoSDZ3Df1tsHL@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwH1+XphYmLmo4T2vVFCPWYAKvz+b2nJttzIJSidntr/p+PkX2D
 reA82BFMsd93jC4pJ4L2jM6iSn9jOTx/KVtZang1h6RwB9Lm+/s/W29U
X-Gm-Gg: ASbGnctaYRHWtmBijVFb4p/bI/wRqW2DEWiP/o9ltzk9eOMYG3/DybGThVfUMbM6Ldd
 /t6xXA7r2wMK1xa0j7ZtkmAXYLDZAgrmtK/6MyvQCcicX81lmK07ZflZeIbq829USJHQSJgeM14
 PqxiVXwbJr0lDsx14EBQUhCESv8bSZS1bSlFvFIkX9bMNdy/jZ3cZZUuanMe/tUbKL/4bOHNyz1
 MZfta92uRzdVFt1G/+35xViG/Ras0Z3S5TPHzk7EV+p3AqW0rNGtlCP9cnrYZ9WPcNV7JUAlL9p
 FxRIBAK2e/T/04cFUCJNMxIgIOy9STfmOU+tflGpfQtoPSoFL0Qd5eT3qaEcO/4aQNDQRMKlLxB
 MsECmf2wqdN8cbBV7zvhPc9oNoXdrEovPRj6FufwSGM9DEun5porWdQ6gtxp3rt18bR1wEnh5re
 sFY3cXMbQc3jMWG4urxa2+/aX/RYDV9H4l
X-Google-Smtp-Source: AGHT+IHWnXlv4dRM4vzXMWoRY25MJATpATYZsdr1JXALWKoi8ryf+IIGyeiD1Q4/mXtjQxafmxbXrQ==
X-Received: by 2002:a05:6a00:1895:b0:7b6:ebcb:51a8 with SMTP id
 d2e1a72fcca58-7c58e0188f0mr11888613b3a.16.1763983612631; 
 Mon, 24 Nov 2025 03:26:52 -0800 (PST)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f023fd82sm14508438b3a.42.2025.11.24.03.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:26:52 -0800 (PST)
Message-ID: <19f0040c-19ab-4200-9c8a-b5c79cd7f4a3@gmail.com>
Date: Mon, 24 Nov 2025 19:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, chao@kernel.org,
 jaegeuk@kernel.org
References: <20251124084255.3033493-1-zangyangyang1@xiaomi.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20251124084255.3033493-1-zangyangyang1@xiaomi.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/24/25 16:42, Yangyang Zang wrote: > Commit 42482e81248f
 ("resize.f2fs: add caution message for resize") > introduced the `-F' option
 to force resizing f2fs without displaying > the caution messa [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNUil-00080B-D3
Subject: Re: [f2fs-dev] [PATCH v2] resize.f2fs: add -g to give default
 options
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: shengyong1@xiaomi.com, Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/24/25 16:42, Yangyang Zang wrote:
> Commit 42482e81248f ("resize.f2fs: add caution message for resize")
> introduced the `-F' option to force resizing f2fs without displaying
> the caution message. And `add_default_options()` implies that `-g'
> enables `-F' for resize by default. However resize.f2fs does not
> currently support the `-g' option. This patch adds `-g' for it.
> 
> Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Sheng Yong <shengyong1@xiaomi.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
