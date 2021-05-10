Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A0C3790DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:34:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg6yw-0003Dz-MC; Mon, 10 May 2021 14:34:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ecree.xilinx@gmail.com>)
 id 1lg6yt-0003D3-PA; Mon, 10 May 2021 14:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=; b=jdhP96iZQL7dJh6rZDVslng7Ne
 z4SNlBHOSNUrKHeRsVuqrj9X7SC5vBh/Swgd7lVj9dWdnWB5p1XpnPaFPx1d97sjtoJg4R1GKcmVy
 ycgrNlPwAUKMOagQJSRQnrBpA/ed883gWhFJD94KmPbMyHexth2jrVOEllZgKK5l0c04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=; b=CzHfu/UZPGx0t+yQ45xg904Y3t
 Lxm8whCBTvG4iKDW44CWLZaQ81kfR3ZUsn+ma5Koy88nI63lV1cxWJIViRUEoNxGTxzaP8yQNDdsr
 0lYfnkesHNxvBj1u4+nh+Xl1qSVtL5KFdpWuSRy+k2SuxIvWNvDqvpijhEbeNB9CDlEY=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lg6yp-0004lI-68; Mon, 10 May 2021 14:33:59 +0000
Received: by mail-wr1-f46.google.com with SMTP id t18so16891380wry.1;
 Mon, 10 May 2021 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=;
 b=jIc4OS4UG1e9Htue39hs2SdJXCmPLn+MTostxG/pw06sXYt4cF0beJY8cOPd4XkNvN
 wMkWqq4rS4nqVWqmlHYwknDCThc4F5oj3a10x6AGXMwZ0Kkxjgx6mU53ky5S6gct5IOF
 gb8YE/CdqFeQhJSfkuXg75IoXDsEW/QKbfnCDm8DSyF/6zHxA2in236S9Jv233h02Cag
 nY/zUkluYzDhxrfM75C6Qnf/beBRBG9DBN2uslTW/jB8AmOrnU4strwuRTlIYCmTiED9
 Adakd2gy/AYmhY6PfiGery2Nb+BVYLJb2xN6RqR96XQSpLkoAkrrTIc1zJH3tzspThUx
 eDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=;
 b=V1LAUnd7ZYeOcpjCaG+jU4hXPex1SwxF2y+ywavVkRqXIFxphyoVQJMzjpyw5ccgGR
 waB+NT7aXmGb6gWk3pP3YwtzkiNCk1Z0i8J3BeU7iCV+8HqsO8gHHTZXKVthzOWEKjvX
 x5LUjFY0+iku0Z++TFY78XlGYRk63PMBixrSlHdQ1PiHj1yP8v/hgPOdQrsmFoA+b6q1
 2WC43DNhXfRkNLeza6psdgusmj7rjKdRMbo+YtOjS89L6aKkbM3ag+30W2KY1K2Km3B2
 gAMqV58tRo+nlQfbBAom3pXxOdpGXLt4D+UolB+qt6l/U6hp8u7gRlcBuM4LV7uAadXz
 2soQ==
X-Gm-Message-State: AOAM533jP0hokg6eCEz+UzcQmwgkfou6ipHChUBsnm/WC5hE6ze2Vyx+
 IMxY1CKx4JvQnPtCUgZSbjY=
X-Google-Smtp-Source: ABdhPJze1q8t3iuv5DjzOv0RveTjqSpEwnprh+IG3St78u9eWCZrU93KSEZYLbobgkyZLBZ/m0bYBQ==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr30469476wrm.314.1620657229579; 
 Mon, 10 May 2021 07:33:49 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id h9sm20117820wmb.35.2021.05.10.07.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 07:33:48 -0700 (PDT)
To: Matthew Wilcox <willy@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <YJk8LMFViV7Z3Uu7@casper.infradead.org>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <ed65025c-1087-9672-7451-6d28e7ab8f92@gmail.com>
Date: Mon, 10 May 2021 15:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YJk8LMFViV7Z3Uu7@casper.infradead.org>
Content-Language: en-GB
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (ecree.xilinx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.46 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg6yp-0004lI-68
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sgx@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, linux-integrity@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/05/2021 14:59, Matthew Wilcox wrote:
> Most of these
> UTF-8 characters come from latex conversions and really aren't
> necessary (and are being used incorrectly).
I fully agree with fixing those.
The cover-letter, however, gave the impression that that was not the
 main purpose of this series; just, perhaps, a happy side-effect.

> You seem quite knowedgeable about the various differences.  Perhaps
> you'd be willing to write a document for Documentation/doc-guide/
> that provides guidance for when to use which kinds of horizontal
> line?I have Opinions about the proper usage of punctuation, but I also know
 that other people have differing opinions.  For instance, I place
 spaces around an em dash, which is nonstandard according to most
 style guides.  Really this is an individual enough thing that I'm not
 sure we could have a "kernel style guide" that would be more useful
 than general-purpose guidance like the page you linked.
Moreover, such a guide could make non-native speakers needlessly self-
 conscious about their writing and discourage them from contributing
 documentation at all.  I'm not advocating here for trying to push
 kernel developers towards an eats-shoots-and-leaves level of
 linguistic pedantry; rather, I merely think that existing correct
 usages should be left intact (and therefore, excising incorrect usage
 should only be attempted by someone with both the expertise and time
 to check each case).

But if you really want such a doc I wouldn't mind contributing to it.

-ed


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
