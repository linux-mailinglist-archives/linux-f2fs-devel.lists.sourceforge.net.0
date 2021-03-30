Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD034DDEB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Mar 2021 04:02:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lR3hh-0004YM-CF; Tue, 30 Mar 2021 02:02:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lR3hf-0004YF-Ru
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 02:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bFQkCWLR9fEuiWIRvXdykfA7mD8bzj0wCWrxZ/xHHts=; b=PEs+BpW7EWfyG7dtYmfwe2jb6Q
 BQgikKIATNxR3rvGHuaNj1rF6dZ/tSCWRR+8TrVrGxawQfCy10Xs+ZzyfGwBp0p+gccpQvYuogmnj
 7/yzyAvQBvfSUKCHqN+tbrjCY9EO/zfjaHo8jNbRsIBuWph2/ohT0+8/UWC0IHFzXo9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bFQkCWLR9fEuiWIRvXdykfA7mD8bzj0wCWrxZ/xHHts=; b=OXziSR2DfywMi8g1R9xjfsu2S5
 /fYxz0rNgjjIXz0hEvqqNi+uk/Qw9424U5libw9WubxyvFFbddN2s/WE7ObBewB1R5Ei1dl1avJt8
 51PooBUxKEAQbCJ0tu8ZwFfm1Y7EE8PlFtCEab8Y3G9KXN14TRBhqsfee/Gfcd1Z0l/g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lR3hb-0000K2-5h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 02:01:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A996157F;
 Tue, 30 Mar 2021 02:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617069705;
 bh=9R+QyMjKEwKKtQwvA/oXHySXD4bXuroEwo7uAjahgbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uGm3qzUSpGBgpDBne8SUTLqeo9w/L39zbcZq1cIzhnpyIuWGMVPFoLhzNOv8l8zKV
 F97kqRVueRXH+y8qvDFMtCPyFRvUnRzkSl1naP+m33TZTsUlnQJa+fTAurk1nwMnYk
 H7VlZL0KP8RQE1Par6p+q2oCq7I/jEpATcYF14YyqWFYbB3WCHRpGmVTGfp1qNbodv
 hr/dXO6B2pQoGAdMeMp7AH0Wk1PUXL/WnN+HQmi/8KEAK3p3p3ZJ5u7zzDPFVlwJGB
 /A/SVdMFh8yfzD5WzkrfHZHnErrTZV2Pgg2V9LbnGHVUwLlDOHGrKw5fm5lPzIO9tf
 ag9ypsLxYXTOg==
Date: Mon, 29 Mar 2021 19:01:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <YGKGhxaozX3ND6iB@gmail.com>
References: <20210329204240.359184-1-shreeya.patel@collabora.com>
 <20210329204240.359184-5-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329204240.359184-5-shreeya.patel@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lR3hb-0000K2-5h
Subject: Re: [f2fs-dev] [PATCH v5 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 30, 2021 at 02:12:40AM +0530, Shreeya Patel wrote:
> diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
> index 2c27b9a5cd6c..ad4b837f2eb2 100644
> --- a/fs/unicode/Kconfig
> +++ b/fs/unicode/Kconfig
> @@ -2,13 +2,26 @@
>  #
>  # UTF-8 normalization
>  #
> +# CONFIG_UNICODE will be automatically enabled if CONFIG_UNICODE_UTF8
> +# is enabled. This config option adds the unicode subsystem layer which loads
> +# the UTF-8 module whenever any filesystem needs it.
>  config UNICODE
> -	bool "UTF-8 normalization and casefolding support"
> +	bool
> +
> +# utf8data.h_shipped has a large database table which is an auto-generated
> +# decodification trie for the unicode normalization functions and it is not
> +# necessary to carry this large table in the kernel.
> +# Enabling UNICODE_UTF8 option will allow UTF-8 encoding to be built as a
> +# module and this module will be loaded by the unicode subsystem layer only
> +# when any filesystem needs it.
> +config UNICODE_UTF8
> +	tristate "UTF-8 module"
>  	help
>  	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
>  	  support.
> +	select UNICODE

This seems problematic; it allows users to set CONFIG_EXT4_FS=y (or
CONFIG_F2FS_FS=y) but then CONFIG_UNICODE_UTF8=m.  Then the filesystem won't
work if the modules are located on the filesystem itself.

I think it should work analogously to CONFIG_FS_ENCRYPTION and
CONFIG_FS_ENCRYPTION_ALGS.  That is, CONFIG_UNICODE should be a user-selectable
bool, and then the tristate symbols CONFIG_EXT4_FS and CONFIG_F2FS_FS should
select the tristate symbol CONFIG_UNICODE_UTF8 if CONFIG_UNICODE.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
