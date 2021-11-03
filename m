Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF9444387
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Nov 2021 15:28:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1miHFk-0005ab-60; Wed, 03 Nov 2021 14:28:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudongliangabcd@gmail.com>) id 1miHFi-0005aV-Le
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Nov 2021 14:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0dPJtFsyQmx1p6zgLfme+3ti9DkyTZvAvvBGtLbYdUw=; b=kURryldUBCCRq4O29F4zyPlWLN
 2lT8WjvP+qVk2ew7oXv+fpM9EfLRMf7CAofNg0naYvFxat6cUG65jWGOBM9oibmxjmRdfmBhRt1ub
 GqlVl9pyVBY2QjJflbG1ooybEqlelodHt7LgzY13fePJuU9oiBMBhzJuYf1gnxIKNAjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0dPJtFsyQmx1p6zgLfme+3ti9DkyTZvAvvBGtLbYdUw=; b=Y02x2BIqUReHXFOd2FvqYqssV7
 lZkS76WAw6bVWpYgQRQj+2YUSjOx8RRtdxGU8OAcAGYRDClZ6w8VrbxAN2UbPZwNxBZPIaHcJC1CN
 E1nj6FAWc/CLRp/TB5s0yBUPsYMErG76Hi25V0/m+0/RON33TSU119JyGBwgEHDTdL88=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1miHFh-0002a8-Vf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Nov 2021 14:28:34 +0000
Received: by mail-ed1-f45.google.com with SMTP id g14so10064696edz.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 Nov 2021 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0dPJtFsyQmx1p6zgLfme+3ti9DkyTZvAvvBGtLbYdUw=;
 b=XKKLOi0EP2zhoFQEdvUxsEl0GUqiZLKWEXa3QTuIe8X+s8kFkyaFGgVgnSoEvyryY+
 a6DxAQBN4E8ThfV7Yq9LKkqaFGfe8oBBK3RyJUVOuiSBfSo1ke2dTl96prEHYHhiXDox
 uZDbVF1RD3A7Ojh/NIW2hLpU2EsmIea09GOkIGfEkmEncV1ARUCiqcEacXrl1Rgf2d/0
 xytLGqxoI6n+i0GZ7TUbaZE/MsYaWolqRestYCgNPjgOaOOpyefGFzoJP+jaRdkLQKzo
 Oh9ja1POHBCHQVMOWJKq1NtZsSAXXUvx1dFRrILn0qkUDOp7GSRFfHwXGwoy80hTKmHr
 bt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0dPJtFsyQmx1p6zgLfme+3ti9DkyTZvAvvBGtLbYdUw=;
 b=R6WuWBQUjHfYIb9Gt6+iZBVE/8f319brFdXBHPdFZoFk09O8GxaczjrEYoxOs9tVda
 OqZMjBJVk+RmiAn/eUOEEVBuca2GEE5tVwnyuLFkjmrwK+2Rr/QnSvx3vvv8W/rKge6J
 IgU9uBWBlpkvNru6Fw0zEeOH0SiRqRR+1wdt7oSQ0Ruckopi/I6Urq8at6sEl6GAK/fX
 itlW+ZpurRxhXBuKjmCDXcdN4mPxE0QZR+3uO9f5BTtD24Yb76gT6CheVu3IOcwKPL8R
 IwdSK0BpMZk9KixMBazChszT2y5V+DjYLeQRYsvmoymALe+/3RqK1NAgn5w9VPCzotZM
 dKAQ==
X-Gm-Message-State: AOAM533lniMX6jBMN5phV2fLsohrH+6g3jFkF8WciZOY0j9CnWBDKv5N
 OfU5D7stZRIdFVhVU57B6sDE61zOIXzbxWEQDCxalfiDjwibMQ==
X-Google-Smtp-Source: ABdhPJyu6KVua4hozKtPkElw96jMvIoioFwAnl4EBS5UWHOnxCk3X2Mq1knuXwDctANVuGKs7IsBxvbK5q+HDyGPA14=
X-Received: by 2002:a17:906:3f87:: with SMTP id
 b7mr45813086ejj.172.1635949706385; 
 Wed, 03 Nov 2021 07:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211103142228.1235864-1-mudongliangabcd@gmail.com>
In-Reply-To: <20211103142228.1235864-1-mudongliangabcd@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 3 Nov 2021 22:28:00 +0800
Message-ID: <CAD-N9QVXNUEsHVaWUjT2eg9MLTX6SXru7JZm_z7PFQO=KPPg=A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 3,
 2021 at 10:22 PM Dongliang Mu wrote: > > f2fs_fill_super
 > -> f2fs_build_segment_manager > -> create_discard_cmd_control > ->
 f2fs_start_discard_thread > > It invokes kthread_run to c [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.45 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mudongliangabcd[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1miHFh-0002a8-Vf
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: fix UAF in
 f2fs_available_free_memory
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 3, 2021 at 10:22 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> f2fs_fill_super
> -> f2fs_build_segment_manager
>    -> create_discard_cmd_control
>       -> f2fs_start_discard_thread
>
> It invokes kthread_run to create a thread and run issue_discard_thread.
>
> However, if f2fs_build_node_manager fails, the control flow goes to
> free_nm and calls f2fs_destroy_node_manager. This function will free
> sbi->nm_info. However, if issue_discard_thread accesses sbi->nm_info
> after the deallocation, but before the f2fs_stop_discard_thread, it will
> cause UAF(Use-after-free).

This UAF only can be triggered in a small time window. Even if
syzkaller generates a reproducer, it is hard to reproduce.

>
> -> f2fs_destroy_segment_manager
>    -> destroy_discard_cmd_control
>       -> f2fs_stop_discard_thread
>
> Fix this by switching the order of f2fs_build_segment_manager
> and f2fs_build_node_manager.
>
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  fs/f2fs/super.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 78ebc306ee2b..1a23b64cfb74 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4135,18 +4135,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>         }
>
>         /* setup f2fs internal modules */
> -       err = f2fs_build_segment_manager(sbi);
> -       if (err) {
> -               f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
> -                        err);
> -               goto free_sm;
> -       }
>         err = f2fs_build_node_manager(sbi);
>         if (err) {
>                 f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
>                          err);
>                 goto free_nm;
>         }
> +       err = f2fs_build_segment_manager(sbi);
> +       if (err) {
> +               f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
> +                        err);
> +               goto free_sm;
> +       }

I am not very familiar with this filesystem. If the building of node
manager is based on segment manager,
we can ignore this patch and try to think up other solutions to fix this bug.

>
>         /* For write statistics */
>         sbi->sectors_written_start = f2fs_get_sectors_written(sbi);
> @@ -4351,10 +4351,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>         sbi->node_inode = NULL;
>  free_stats:
>         f2fs_destroy_stats(sbi);
> -free_nm:
> -       f2fs_destroy_node_manager(sbi);
>  free_sm:
>         f2fs_destroy_segment_manager(sbi);
> +free_nm:
> +       f2fs_destroy_node_manager(sbi);
>         f2fs_destroy_post_read_wq(sbi);
>  stop_ckpt_thread:
>         f2fs_stop_ckpt_thread(sbi);
> --
> 2.25.1
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
