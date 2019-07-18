Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21D6D694
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jul 2019 23:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwL0k2AQE8APnim0vU3ObZWSCLcFQ8hVcxUMK7bb68U=; b=mFsLdSlcs8qoG5Ny0Rvi398xjS
	a0V9QKxI4+vNLyILU5TGWuYtm2L6LgIiEW6454yfYyHmWeuNWKuw082wAbC0N2/dp0GBl3kzVJ37W
	101uXqzR79PmKgMPlI4VSw6yrG7amVrGDfIm/J+GrbgMAWz0igRcPstbb3dYrs8yg33c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoE6i-0003I0-AQ; Thu, 18 Jul 2019 21:38:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1hoE6h-0003Ht-Bz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 21:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=knozEXRhXWvdO7buD7BicWZWalyyFDnCOXnDxt6wCPU=; b=EXv1z6Zy3CqdUtfqLgqCD7DekP
 FjXCBnJXOrWLb4yvXhKVxmKPM8ojqkkONKmTlfkTxQOAbC6FD2psOB5OWQjxkR4ifEbf0OecdcB76
 VrSIUrtori6MVVpk0xQ7NCI22Krs3epqkhXFWMXsdZih/8mo9AHw687huBQkKzoSaieM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=knozEXRhXWvdO7buD7BicWZWalyyFDnCOXnDxt6wCPU=; b=i0fmtPlDQngOmrcSkhJl9URAYQ
 6lHPs1apxmmBF7r4nMaTZnWXJjQrWDEI7g9SJzgk5nJtR0Yte1jYRtrrJY+dqdUe2H3DEVZQvgA3z
 EKRxeS8abogmM4pPOoysuARydymIMHKGkPrBCtAmtij1jOhQVXpoyPVCMCOXD6yFtJts=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hoE6f-007Aet-Cn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 21:38:31 +0000
Received: by mail-oi1-f196.google.com with SMTP id t76so22748052oih.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jul 2019 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=knozEXRhXWvdO7buD7BicWZWalyyFDnCOXnDxt6wCPU=;
 b=m5PM/hPG+b9HQoKIZGbV+Ijuf2K7lQCUeVE/31Yx0s2UJXJinuR6TELqMMBQe1zNK+
 ITaF4LxTfpVYJT/CB5uauiVzBIPXdmJOiNiHEeLPUYTc8daNjxKKpM+5C/igF5zhrMkY
 /dg5e5/uO7JhNJ/T3J42WAIKkjI6M+DcpIRy3c80cp+0VFInZXxdthcYl6i8hH6m4JNj
 j2V3FyAxSuy5KM7hfAhUZaFUSwuaKxs+KQ+oKowAuYtAOHsfsxVKNnqPIlHfxaTGTwux
 Mi40vng0pTS6OLBl6pMVGG/F1rxxCimHBrEo28sK8by3GCDNubTjdjUIh51eN4R4vbhw
 KMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=knozEXRhXWvdO7buD7BicWZWalyyFDnCOXnDxt6wCPU=;
 b=Jioa3FI6wJAna7R9Iv7zg49LYEt5fpEzZpbNHMaA2ydC1EgO3E1comE4XifZDqDF1M
 v+OQVO2ueUIuwRYB3m6ptullvaQ+wmVXy3+kYZg9oWHQEvpMt1p4epQ/KmnlsnRzcznP
 NZPzmPLwilJV+5j7QZUhaOYp++VinrrMC6yJQhB9mYwIOU8q/VqnHs0ItxGnlzKwIkDw
 Q7eBSp6iNwWAkcLc+XGg1cYcjkoxrlWU70tUfKoHwfAPqzwciz0icU0iqx699Yw4Oyou
 0TgqMZin79cixjf2GNIuonO6YxJDNyAL7QY7qrvYu3SRTfxYtCPF6tZpiJfA+jnpqeHc
 hvZA==
X-Gm-Message-State: APjAAAVzhFYRDQyOifM1n9Crtio8FD8U/qJsFA5v26ACWaFZBgMtgMT4
 ODpkVz+r4uxQ1lWitiULJ+ekQEgaJbqVLA==
X-Google-Smtp-Source: APXvYqwt4Z+EcKNr4IglRcV9oiMsLHIXxnnhpixhnoN9PRcEQhoL633rKS/P9Lo0QuqjfEkYVbLOgw==
X-Received: by 2002:a63:1305:: with SMTP id i5mr50423942pgl.211.1563485497578; 
 Thu, 18 Jul 2019 14:31:37 -0700 (PDT)
Received: from drosen.mtv.corp.google.com
 ([2620:0:1000:1612:726:adc3:41a6:c383])
 by smtp.gmail.com with ESMTPSA id v3sm26810539pfm.188.2019.07.18.14.31.36
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 14:31:36 -0700 (PDT)
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
References: <20190717031408.114104-1-drosen@google.com>
 <20190717031408.114104-3-drosen@google.com>
 <cbaf59d4-0bd3-6980-4750-fbab14941bdb@huawei.com>
Message-ID: <4ef17922-d1e9-1b83-9e89-d332ea6fb7ae@google.com>
Date: Thu, 18 Jul 2019 14:31:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cbaf59d4-0bd3-6980-4750-fbab14941bdb@huawei.com>
Content-Language: en-GB
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hoE6f-007Aet-Cn
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Support case-insensitive file
 name lookups
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 7/17/19 3:11 AM, Chao Yu wrote:
> We need to add one more entry f2fs_fsflags_map[] to map F2FS_CASEFOLD_FL to
> FS_CASEFOLD_FL correctly and adapt F2FS_GETTABLE_FS_FL/F2FS_SETTABLE_FS_FL as well.

I don't see FS_CASEFOLD_FL. It would make sense for it to exist, but unless it's in some recent patch I don't think that's currently in the kernel. Or are you suggesting adding it in this patch?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
