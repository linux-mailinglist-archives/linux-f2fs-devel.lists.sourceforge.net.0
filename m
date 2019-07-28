Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8E77EDF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 11:52:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrfqP-0006yk-Uk; Sun, 28 Jul 2019 09:51:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guaneryu@gmail.com>) id 1hrfqN-0006yW-P3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 09:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d8iNABSCoA76pmGK9qmPaGq65cJlxUTHLSDeA2aeOrA=; b=XO+L+cqmJFQwwUldoaep6aopiA
 8PNTY3gj3mvWt6hbYtnpVk/eBwckedZvoprxgDWjcDSlMsDt39f13h59co3QBrJbxL1cMgG7xLqXS
 4YFwD6A0G3hpuggOD0mNLkqL6U0a6AqC6VJDI3lQa9cEbXuOnHPuHp6Yi33R5o5rC5Dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d8iNABSCoA76pmGK9qmPaGq65cJlxUTHLSDeA2aeOrA=; b=ZHSD3Ts5d6WI0lLODMJ+/+4/uU
 N96ZGWxO5Clu7nn+QjE0owx6in/4UlY3fiPe5SmVMyjodVlPUJXy3DI8NY4IZtvThQQL+AW+0YskP
 MwVBSszVkaFJ83ULQQNWzeEA5TyW9U0Ek+VuThOLcpjXCwEX31g3giNfgLj6WEevYoYw=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hrfqM-00A2Nk-EE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 09:51:55 +0000
Received: by mail-pf1-f193.google.com with SMTP id u14so26552675pfn.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Jul 2019 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d8iNABSCoA76pmGK9qmPaGq65cJlxUTHLSDeA2aeOrA=;
 b=eG9clFKjkjwtrelJY+QQiUECgI+8Bxiex/zXnX0aeWYz61ZKCPdqXyjdx+Kj+n5J9K
 3ms/GdiunNPRZuFSkN4TMJX58MAZuXBw1fAwq0APa+H733EwtXzwTU3oBLaI85AWOOKm
 2i3ihd8fgFwHo43icZ+8pdHv9STPBjcbcI2eFEW4VJYH5zeaN1DGVARC0GRAoDs4yuK+
 etXK9UpqkT8gi6dlvFU32FoUmne1HxESzeiFVzXuzhGS0Dp5SR9XhXCMAic/mYK94kX+
 YMPLv+6sjnjKXL0Adn4FoK0dEpG9JYl5h0+dTE1ujqbrbVhc8HWlJggMUqeoB3CfuJMJ
 vOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d8iNABSCoA76pmGK9qmPaGq65cJlxUTHLSDeA2aeOrA=;
 b=qlAQGoUR/OBbwvv729KJai5AH7+mVWxjqgY7AXUeBMa/8b15rzjlbcakzjiybwrqFp
 eA+PvnVpyhxdLhgiZpccnxm6Av+S1ax2twVfDR2PIbShmLRSc06lEnoOOcWK1taPNd4p
 Ot5EpuL8we+k3c6vgrsDSSvFD46t27Mq/8r15EXF1IFAUUiCrT8i2h7e8CEYazFRi1UO
 BCs+ebAWEkzGiry3yU/8cXvi45tc0SZv6WKkBoGDCHBYbogTSnri+/g8UIi2IeUX1geD
 p6rG6+r4eBZezs3G1+m7tYLcSNdr6l4ku0jWxeCk6Xyj4oz9EkKjHIJ/JjJnpmDfCiwE
 8h2Q==
X-Gm-Message-State: APjAAAVGI+vh7VhL+2qzZHW/Svs6LLPfaHtnUuF3J67rkw5ARFxfup8o
 ZuebtwyyJNTd0ohZcZbKt/c=
X-Google-Smtp-Source: APXvYqyIAK2pahg7qBTd2KJN/pZYK2Vu4MNbPTaOuqgx+CtE1M32/LB+lv8Mpj4v4Rz/Y4aDHXAsBQ==
X-Received: by 2002:a63:a35e:: with SMTP id v30mr39657045pgn.129.1564307508628; 
 Sun, 28 Jul 2019 02:51:48 -0700 (PDT)
Received: from localhost ([178.128.102.47])
 by smtp.gmail.com with ESMTPSA id q126sm14748715pfb.56.2019.07.28.02.51.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 02:51:47 -0700 (PDT)
Date: Sun, 28 Jul 2019 17:51:41 +0800
From: Eryu Guan <guaneryu@gmail.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190728095141.GM7943@desktop>
References: <20190723092529.112426-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723092529.112426-1-yuchao0@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (guaneryu[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hrfqM-00A2Nk-EE
Subject: Re: [f2fs-dev] [PATCH 1/3] generic/38[3456]: adjust to check
 prjquota before mount
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
Cc: jaegeuk@kernel.org, chao@kernel.orga, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 23, 2019 at 05:25:27PM +0800, Chao Yu wrote:
> Move _require_prjquota() to front of _qmount() since we do the
> check on device directly instead of mountpoint, it can avoid
> potential failure if filesystem utils needs exclusive open on
> device.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

We've done similar changes before

23f60ef304d6 ("generic/38[3-6]: require project quota to be enabled on
SCRATCH_DEV")

but later it was reverted by

f722c48d4cd5 ("Revert "generic/38[3-6]: require project quota to be
enabled on SCRATCH_DEV"")

Because we use quotactl(2) to check if prjquota is enabled on the given
device (src/feature -P $dev in _require_prjquota), and quotactl(2)
requires the given device is a mounted device.

Thanks,
Eryu

> ---
>  tests/generic/383 | 2 +-
>  tests/generic/384 | 2 +-
>  tests/generic/385 | 2 +-
>  tests/generic/386 | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/generic/383 b/tests/generic/383
> index 2c8c5923..cf5ac255 100755
> --- a/tests/generic/383
> +++ b/tests/generic/383
> @@ -39,6 +39,7 @@ _require_xfs_quota_foreign
>  
>  _scratch_mkfs >/dev/null 2>&1
>  _scratch_enable_pquota
> +_require_prjquota $SCRATCH_DEV
>  
>  do_project_test()
>  {
> @@ -76,7 +77,6 @@ EOF
>  # Test project
>  _qmount_option "usrquota,prjquota"
>  _qmount
> -_require_prjquota $SCRATCH_DEV
>  do_project_test
>  
>  # success, all done
> diff --git a/tests/generic/384 b/tests/generic/384
> index b7c940d7..2c0cd00b 100755
> --- a/tests/generic/384
> +++ b/tests/generic/384
> @@ -57,10 +57,10 @@ chmod a+rwx $seqres.full	# arbitrary users will write here
>  _require_scratch
>  _scratch_mkfs >/dev/null 2>&1
>  _scratch_enable_pquota
> +_require_prjquota $SCRATCH_DEV
>  
>  _qmount_option "prjquota"
>  _qmount
> -_require_prjquota $SCRATCH_DEV
>  
>  report_quota()
>  {
> diff --git a/tests/generic/385 b/tests/generic/385
> index 937131a9..56ce6eb0 100755
> --- a/tests/generic/385
> +++ b/tests/generic/385
> @@ -56,9 +56,9 @@ quota_cmd="$XFS_QUOTA_PROG -D $tmp.projects -P $tmp.projid"
>  
>  _scratch_mkfs >/dev/null 2>&1
>  _scratch_enable_pquota
> +_require_prjquota $SCRATCH_DEV
>  _qmount_option "prjquota"
>  _qmount
> -_require_prjquota $SCRATCH_DEV
>  
>  #
>  # Create the project root
> diff --git a/tests/generic/386 b/tests/generic/386
> index 462c5869..e4f7d23b 100755
> --- a/tests/generic/386
> +++ b/tests/generic/386
> @@ -112,10 +112,10 @@ echo $proj_num:$proj_dir > "$my_projects"
>  
>  _scratch_mkfs					>> "$seqres.full" 2>&1
>  _scratch_enable_pquota
> +_require_prjquota $SCRATCH_DEV
>  
>  _qmount_option "prjquota"
>  _qmount
> -_require_prjquota $SCRATCH_DEV
>  
>  mkdir -p "${proj_dir}"
>  
> -- 
> 2.18.0.rc1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
