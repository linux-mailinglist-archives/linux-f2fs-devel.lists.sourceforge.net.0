Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA16E5754
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 04:11:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poaok-0006II-GU;
	Tue, 18 Apr 2023 02:11:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1poaod-0006IB-Va
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 02:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=30LF+74h47bireainrLuyJUJ7mJ1XOOzx7GiLgJnkq4=; b=KqkSWSmjtElJe5r/inhJUgR2Jj
 fJlN24mMW1oKqmPOi2CsHWS8JbHmhgxAAQS/q+b3Tei5pokB/UXGru4JKv35ESahLnYW5DR0AvjPk
 9+jRq9iWZ4myRSyJKRAetou7MXLjj8ui/OHwmfjYgps6Kr0Kx1nnk9aJwJI0W+HjQVFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=30LF+74h47bireainrLuyJUJ7mJ1XOOzx7GiLgJnkq4=; b=GB3DenJDpqKRdRCV4lQdhFMM3n
 9sR16h7dG67L2URNGIyTz4o65+ih7JZOW/QqBaDJAY1X6za9k51zud4jl23ukzfSUwhBKyDeALSfn
 jledb2JabgQdcxEKx02vMcVoV2nvGXVihNJbuFp/+nolageZDUT/Goo3B7ucq2qOCcBQ=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1poaoX-00B2e5-SY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 02:11:31 +0000
Received: by mail-pl1-f173.google.com with SMTP id lh8so14739020plb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Apr 2023 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681783880; x=1684375880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=30LF+74h47bireainrLuyJUJ7mJ1XOOzx7GiLgJnkq4=;
 b=lgkprahT40tqQeRc4PO26Jp/f18/2SbJOZQf0Rhiw3RdsSerCuGwlFNmBEBazdCknI
 1/ZNAi+HB/7xO5nWI4pc3DkshTdI/AWrr5IFFTmGLAoiTlwCJS/RioNsYY/PTixuKDtb
 1W89nrBXfwjrc2PoiqlidrkS6EzALcqxlRqP5sauwaDKhiD+o+mvXRPTRe9ytQXotRkE
 mELBOZ7L1kwOk2bFVG+bbPvJ+22RPs4aFg/tfkm/wSnXXDR9+BFzMLW7NyxSRs+MJgdh
 J2ccFcCy9DCBXD9d8IHEMVPVFbHXuQhQQj91KesPm2lHjhnrqhdHWjv75MlTWVl5n7qW
 CGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681783880; x=1684375880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=30LF+74h47bireainrLuyJUJ7mJ1XOOzx7GiLgJnkq4=;
 b=Jt4AjTZyokC9dANgSOQhSGN/j6F4fteToSpH6Qg41KiRfN/indlzzF5PVz+6gHSH7K
 SzhysFbhxhtGYsKiStP6M0gfMziju7DtiBzwytE9bdpsgKWdvXIbE+y/B98bDtZvn5zA
 UiuOmEE7u7HNN2Lh7GYzyq12UXbPzbriX4BU0poC234VEBjmY9Y3aaSPkK8macm6q+BZ
 qhPEVSI1tiDwWAm+AzOUroD0ExtRDz+c8AHgdyCZHwswocOKigrPcZ8MCI9Ap4dkSsNR
 kKUtGVa08YiBxxPnIsIpi6lVlT2Q35rqO9Lhjn8jcIQ8nalXpqmGr4l3NTF/g1z2JTqh
 ymwg==
X-Gm-Message-State: AAQBX9fTVv452DhgaUbOS/wX4GqwhC1b30mn++Gk+ljhtS6TYrCFvYHO
 uPh+uSNBnXMldJfuJOdLYAo=
X-Google-Smtp-Source: AKy350aOOiDkLzk1dzYsDdo+Y5rFtFQYG6MGFGKTxrR5ASI4L+Vshmq/XhawN6xegxioU96rxz6k6A==
X-Received: by 2002:a05:6a21:7891:b0:ed:ca22:a1e7 with SMTP id
 bf17-20020a056a21789100b000edca22a1e7mr18463189pzc.16.1681783880149; 
 Mon, 17 Apr 2023 19:11:20 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-15.three.co.id.
 [180.214.233.15]) by smtp.gmail.com with ESMTPSA id
 r5-20020a635145000000b005186e562db0sm7581267pgl.82.2023.04.17.19.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 19:11:19 -0700 (PDT)
Message-ID: <4517330a-00a3-220f-2fc5-a9ef4aba5ea8@gmail.com>
Date: Tue, 18 Apr 2023 09:10:39 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20230417044100.56409-1-frank.li@vivo.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230417044100.56409-1-frank.li@vivo.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/17/23 11:41, Yangtao Li wrote: > Let's descrbie it's
 read extent cache. "Clarify the fact that extent_cache and noextent_cache
 toggle read extent cache on or off." > -extent_cache Enable an extent cache
 based on rb-tree,
 it can cache > - as many as extent which map between contiguous
 logical > +extent_cache Enable a read extent cache based on rb-tree, it can
 cac [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bagasdotme[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.173 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [180.214.233.15 listed in dnsbl.sorbs.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1poaoX-00B2e5-SY
Subject: Re: [f2fs-dev] [PATCH v2] docs: f2fs: specify extent cache for read
 explicitly
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/17/23 11:41, Yangtao Li wrote:
> Let's descrbie it's read extent cache.

"Clarify the fact that extent_cache and noextent_cache toggle read
extent cache on or off."

> -extent_cache		 Enable an extent cache based on rb-tree, it can cache
> -			 as many as extent which map between contiguous logical
> +extent_cache		 Enable a read extent cache based on rb-tree, it can cache
"... . It can cache ..."

>  noinline_data		 Disable the inline data feature, inline data feature is
>  			 enabled by default.

"Disable inline data feature, for which the feature is enabled by
default." (submit as separate patch).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
