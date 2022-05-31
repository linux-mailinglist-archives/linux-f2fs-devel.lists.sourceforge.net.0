Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E0353970B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 21:33:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nw7cV-0000KB-BZ; Tue, 31 May 2022 19:33:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <zlang@redhat.com>) id 1nw7cT-0000K5-MX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 19:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EYvM+DjLdbW9FAA0uag5ZaxyY3UTDz5o1E6qwsuN23g=; b=g7VODB30BgdwQO4bIlsmK61Cw9
 XAITVS2mRiXa6OVlTiGbOkBIPV+rW5EmAZxj56LQKZQpcW6BeA+Z3ETOAuEIiwYrQ9E4UBePSw8W6
 yRBnNbB1av5p23N0S3uM3LFOj8Stdt6PQ7qUEQ3VM3VuQHrhUcXuTNHEhPCqDzAxge80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EYvM+DjLdbW9FAA0uag5ZaxyY3UTDz5o1E6qwsuN23g=; b=j4bO/1uZVufswN4S2ZaLrGD0Bn
 T3vNkYLLDMbkhLtU4IvhDl+GEqpKaFA4xVTbSXkGkOSOEDx1hchCju0pEDU/ED+ley+EHOFvuhpW3
 tUTMPcy320ab7PIPyhc0kM4lRVFbTxffQznt8AV6RqI8CQrUuCPeEWtISdCVNbXJEzSY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nw7cM-0004Ok-9R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 19:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654025598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EYvM+DjLdbW9FAA0uag5ZaxyY3UTDz5o1E6qwsuN23g=;
 b=OCeshO/gSGgKackuSrs98NbXfWM1v0FufQZJS7YPyg76TPvqI+hZ3soMWAvvLdJH8b8BRc
 KNPGaLve39clTTt86P4BGtVZ0qEoMcprTnJv/xwOwc+NoSeRfI15pih+YR6BM8OGW5dVZd
 dS5R/pjwEUk6Fco1TxITfObM8rGiFQY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-3nd7aKiUNV2c4o9uTJ9Bew-1; Tue, 31 May 2022 15:33:17 -0400
X-MC-Unique: 3nd7aKiUNV2c4o9uTJ9Bew-1
Received: by mail-qt1-f199.google.com with SMTP id
 h17-20020ac87d51000000b00304b86fd55bso2769690qtb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 May 2022 12:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EYvM+DjLdbW9FAA0uag5ZaxyY3UTDz5o1E6qwsuN23g=;
 b=xytkxoEn3saS9AqXw9QHLK6+Aecyoti5juFXTmgMFOd8Ef9g4d5DaC0pfyFS121cXm
 0HR48sBw/G4QAnrfec6D6H3o4QBvIY9YwuVWWqBidVZu97qyX5C6EZ4stSY+r0/Xejsl
 PyjHhHnAVZthSnpYTpEOiXt2ix2fiKB0FpghHk9Ivy7VDAEeBgc7OtMy3tQGUqiipsQR
 dK7J0PICnAPWneWCT5dApFcpQ3px8JmLZwlDQtTJl+7FX+ZB6ZAJrOA9jxxy/6oxs6ax
 LcVoo96CStG7bEWuLWBQZsWqmVdt7PylWVBOfljrO/BHX+av5V9TPUwqHjH1gscnCJ0W
 5Rlg==
X-Gm-Message-State: AOAM530ww3gTHaasr0Mua2uSWQ/t/AJdrc1X+484a+w+Lql41LUJflAF
 +6k3YMAB+CM1vrUbuJKG25DKsMfm1gf3f5x4cHXeRR0/bdr3M1c1VK7QlKATZyEr71sDjx0H27H
 wOHCHjWxA8nUKM3BE63lZSge9B+YTN/kQloqzTQ==
X-Received: by 2002:a05:6214:802:b0:462:4eb0:1ec2 with SMTP id
 df2-20020a056214080200b004624eb01ec2mr34236645qvb.92.1654025596453; 
 Tue, 31 May 2022 12:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4EEJsXvGLrMvs7pE/FecElyRmbrkICUtE9svhiwD+muhTARiVb87zXs5ulS/1olzHu8pgBA==
X-Received: by 2002:a05:6214:802:b0:462:4eb0:1ec2 with SMTP id
 df2-20020a056214080200b004624eb01ec2mr34236626qvb.92.1654025596232; 
 Tue, 31 May 2022 12:33:16 -0700 (PDT)
Received: from zlang-mailbox ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y12-20020ac8524c000000b002f39b99f685sm9428214qtn.31.2022.05.31.12.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 12:33:15 -0700 (PDT)
Date: Wed, 1 Jun 2022 03:33:10 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20220531193310.4xdwvefqdvay4mhc@zlang-mailbox>
References: <20220521031621.3494402-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220521031621.3494402-1-chao@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=zlang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 21, 2022 at 11:16:21AM +0800, Chao Yu wrote: >
 Testcases like generic 342/502/526/527 expect that filesystems will > recover
 all related metadata changes to the file which was fsynced > be [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nw7cM-0004Ok-9R
Subject: Re: [f2fs-dev] [PATCH] generic: adjust strict SPO recovery
 testcases for f2fs
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 21, 2022 at 11:16:21AM +0800, Chao Yu wrote:
> Testcases like generic 342/502/526/527 expect that filesystems will
> recover all related metadata changes to the file which was fsynced
> before sudden power off.
> 
> This patch adjusts to use "fsync_mode=strict" mountoption for f2fs
> to pass these testcases.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

I don't have better idea, so it's good to me.

Reviewed-by: Zorro Lang <zlang@redhat.com>

I'm thinking about is there only f2fs has this kind of requirement? If this's
not a single problem, we can help a common helper for that. But if only f2fs,
I think this change is fine.

Welcome better ideas if anyone else has. If no more, I'll merge it.

Thanks,
Zorro

>  tests/generic/342 | 5 +++++
>  tests/generic/502 | 5 +++++
>  tests/generic/526 | 5 +++++
>  tests/generic/527 | 5 +++++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/tests/generic/342 b/tests/generic/342
> index 676b876b..cdffaaf3 100755
> --- a/tests/generic/342
> +++ b/tests/generic/342
> @@ -31,6 +31,11 @@ _require_dm_target flakey
>  
>  _scratch_mkfs >>$seqres.full 2>&1
>  _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>  _init_flakey
>  _mount_flakey
>  
> diff --git a/tests/generic/502 b/tests/generic/502
> index b0f9077f..b5589b81 100755
> --- a/tests/generic/502
> +++ b/tests/generic/502
> @@ -34,6 +34,11 @@ _require_dm_target flakey
>  
>  _scratch_mkfs >>$seqres.full 2>&1
>  _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>  _init_flakey
>  _mount_flakey
>  
> diff --git a/tests/generic/526 b/tests/generic/526
> index dc7cb36c..ada4dbee 100755
> --- a/tests/generic/526
> +++ b/tests/generic/526
> @@ -32,6 +32,11 @@ _require_dm_target flakey
>  
>  _scratch_mkfs >>$seqres.full 2>&1
>  _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>  _init_flakey
>  _mount_flakey
>  
> diff --git a/tests/generic/527 b/tests/generic/527
> index 40cd1c6a..de09d171 100755
> --- a/tests/generic/527
> +++ b/tests/generic/527
> @@ -32,6 +32,11 @@ _require_dm_target flakey
>  
>  _scratch_mkfs >>$seqres.full 2>&1
>  _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>  _init_flakey
>  _mount_flakey
>  
> -- 
> 2.25.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
