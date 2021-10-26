Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CEE43B8B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 19:57:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfQhR-0005qf-7Z; Tue, 26 Oct 2021 17:57:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1mfQhP-0005qY-RY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uXHfZ86odio1b4QPRjCoCHQLyWLuNFoC6/YMvOwKHbk=; b=ZskWIzSh/PgbRbRSJxXp2WQRN7
 JJK9geHjm53Z1sGZbawC/IUBWxaB5+4uYCJ5QzO4it140Z8eozMe1wksJ0XHD4IPQP+bplEPUygVd
 wn/1tIaRF1hio2Gd7edSuWCckMjgum3aViXcKxjDf8+1fEhcL4soj0SEE1csjWwjzR4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uXHfZ86odio1b4QPRjCoCHQLyWLuNFoC6/YMvOwKHbk=; b=FUcqAUQ2SA0U4XzRiquYcsblUP
 Lbpz/tZEbfYjiCvDG2yJ0+EdTFgSsw0Z/ZA8gFbLbC/EN6ZCnRNBvyGm2eK7fIVoAlN0O/Y70oGCs
 WLMAP6CnYPekW6x4xnW+AJDDr3781MGIQY74YCKMajxRJZYuWgC/4k/VYV4OurnLsrs0=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mfQgv-00HR7z-PL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 17:57:23 +0000
Received: by mail-lf1-f46.google.com with SMTP id p16so592852lfa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Oct 2021 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXHfZ86odio1b4QPRjCoCHQLyWLuNFoC6/YMvOwKHbk=;
 b=iSryYreFEEivvuynGghPKji0V27StpxuxQV81oxzdKf7oPUM82JVS5MutIo+tu0jFV
 L+VfHnxo/J+4VSjBHMziRFkse0SiEpcXYeLNR3WNLL/KSyVTiRihRjZzTDzcWKd/V1Sn
 agEHLEzzT/2rHIdhJY8NpiIcG6kZG2LgYZV08mn+Hc8bpXuyCXauRJR6rOKe7U2T+son
 gF+GWZvW3RnffEzPZZN4b3sKKS+8N2Np/tML8o5Kmta+8FxHQYaaCVlolVuOemfd3Rp6
 D0djKcWReIheSG1A5UICHh47rrjiBtzBp4MqDGlPAkbo9f6tqiea0X60V9TNE9Z6Bu28
 Bp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXHfZ86odio1b4QPRjCoCHQLyWLuNFoC6/YMvOwKHbk=;
 b=KaSFHMElZsjj2Ze7c7JI2VsYKrzLz8bFJ/C7+M5Ic7mauob5T8LwB9lh3g30Zbz3bT
 MrqNoVQoR18qE37DDxFmKOwA6+12mRrlfHREcTbZm4DcQWmBdXRhOCAjmVxt91ohTEcY
 aZLuY5w7+dnHAiuCFwCE1FDADpwmUOnLamoxnxlrMlbcSBGSQH3SPNAKcCfJ8AO3ntlB
 G9FhE74Gkk4Ip1zvffP8Yjxz7oVX3IjOc0ItRORWv2BRbSCmKQDZAkF4mss2XcxZ9zF2
 u7miv7IuneXUyEUWhn0MdtZFtftzY5/lJ5yxMO80aDNd06Em+WFRR1+hfrPeKRt/jSjs
 aO2w==
X-Gm-Message-State: AOAM531m4J6BH6eD+BTA5jljIxFiMiV0wW0pekpeW1RC6e8NhGb+c3/F
 ZeXSMjMw/m3IyQ5DFOqTxgQ5URum115o/T/qw5E=
X-Google-Smtp-Source: ABdhPJxd9EPqnGWJhhp7pr+ysGJmauvoQPXQHrcaTI4Vg6ZicUI/FwgvLc3Z9OiQooRf7CHujdCFr3QEQ1xvPm6l1k8=
X-Received: by 2002:a19:6742:: with SMTP id e2mr23660988lfj.568.1635271007226; 
 Tue, 26 Oct 2021 10:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211014190503.717830-1-daeho43@gmail.com>
 <e8b106fb-2878-2fa9-788f-965eef179a85@kernel.org>
 <CACOAw_yupuz+Xx-z9V0UaExuARHd8H9rruWCa2yj5-mgkeuUtQ@mail.gmail.com>
 <3ddb4013-8d63-7c00-6fdd-1f21752bd60c@kernel.org>
 <CACOAw_wjhr8j=-qEDHP_H+_7cTh_ep7Wix4=JC+5x5zp-zpUFA@mail.gmail.com>
 <c93106ef-b567-b973-7241-ea2fcef84855@kernel.org>
In-Reply-To: <c93106ef-b567-b973-7241-ea2fcef84855@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 26 Oct 2021 10:56:36 -0700
Message-ID: <CACOAw_xOOcoTCYnxtSq9Sqn0aUvt=F_6UgUwWeh9RkS5Oj-RDg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Headers-End: 1mfQgv-00HR7z-PL
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove circular locking between
 sb_internal and fs_reclaim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Yes, I doubt the problem may also happen in f2fs_evict_inode() with below
> callpath:
>
> - evict_inode
>   - dquot_initialize failed
>   - sb_start_intwrite
>   - f2fs_truncate
>    - dquot_initialize lock dqio_sem
>
> How about this?
>

Got it~
Then we need this in both f2fs_evict_inode() and f2fs_drop_inode().

Thanks,

> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> old mode 100644
> new mode 100755
> index b24b9bc..0e49593
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -728,6 +728,7 @@ enum {
>       FI_ENABLE_COMPRESS,    /* enable compression in "user" compression mode */
>       FI_COMPRESS_RELEASED,    /* compressed blocks were released */
>       FI_ALIGNED_WRITE,    /* enable aligned write */
> +    FI_QUOTA_INIT_FAIL,    /* inidicate failed to initialize quota in drop_inode()/evict_inode() */
>       FI_MAX,            /* max flag, never be used */
>   };
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> old mode 100644
> new mode 100755
> index 13deae0..2fb53f54
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -789,9 +789,11 @@ int f2fs_truncate(struct inode *inode)
>           return -EIO;
>       }
>
> -    err = dquot_initialize(inode);
> -    if (err)
> -        return err;
> +    if (!is_inode_flag_set(inode, FI_QUOTA_INIT_FAIL)) {
> +        err = dquot_initialize(inode);
> +        if (err)
> +            return err;
> +    }
>
>       /* we should check inline_data size */
>       if (!f2fs_may_inline_data(inode)) {
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> old mode 100644
> new mode 100755
> index 1213f15..16cf50c
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -758,6 +758,7 @@ void f2fs_evict_inode(struct inode *inode)
>       if (err) {
>           err = 0;
>           set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +        set_inode_flag(inode, FI_QUOTA_INIT_FAIL);
>       }
>
>       f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
> @@ -770,6 +771,8 @@ void f2fs_evict_inode(struct inode *inode)
>   retry:
>       if (F2FS_HAS_BLOCKS(inode))
>           err = f2fs_truncate(inode);
> +    if (is_inode_flag_set(inode, FI_QUOTA_INIT_FAIL))
> +        clear_inode_flag(inode, FI_QUOTA_INIT_FAIL);
>
>       if (time_to_inject(sbi, FAULT_EVICT_INODE)) {
>           f2fs_show_injection_info(sbi, FAULT_EVICT_INODE);
>
> Thanks,
>
>
> > In fact, I picked up the idea from here.
> >
> >          err = dquot_initialize(inode);
> >          if (err) {
> >                  err = 0;
> >                  set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> >          }
> >
> >          f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
> >          f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
> >          f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
> >
> >          sb_start_intwrite(inode->i_sb);
> >          set_inode_flag(inode, FI_NO_ALLOC);
> >          i_size_write(inode, 0);
> > retry:
> >          if (F2FS_HAS_BLOCKS(inode))
> >                  err = f2fs_truncate(inode);
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
