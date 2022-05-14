Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716F5270FD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 14:09:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npqaH-0002wI-Nh; Sat, 14 May 2022 12:09:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ritesh.list@gmail.com>) id 1npqaF-0002w0-MW
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 12:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Go1aD/L4/NwaeqwABKS0DOpnE/e7XYIGVtitFbk6RI=; b=PV+5GsslcLQmwyc+HVvHSQWqVE
 O/JluVW16C92Bs+lyPaEpE8/vCLUrD44ASL1wJ3Hwcw/0fCSuInyeeZB+21KCJejHR+RZuoRUQS8t
 KllRBrskTHVaMiAP6kM2GnA7zjdSXctwbXf6QTJwVmfBNzvlciDYbPFFuekKVUddmwh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Go1aD/L4/NwaeqwABKS0DOpnE/e7XYIGVtitFbk6RI=; b=cWn48qzbptwwPiHVfwPJ9LujKf
 PxRDK+ixhCoBYHC0EHxnwvJs7fMl4o7DXrIMg7KE4Ux1EXsP2PGXuojA4FDk81APz5TfLx3ON7Vm0
 pRKkotWfTpfhEuKKkwhu1SDtr+BwHStrDEZj2N3z/bj29GqqP2EGWykfgA72iqbtv9jI=;
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npqaB-00068V-N1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 12:09:19 +0000
Received: by mail-pg1-f180.google.com with SMTP id a19so9653267pgw.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 May 2022 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9Go1aD/L4/NwaeqwABKS0DOpnE/e7XYIGVtitFbk6RI=;
 b=cr9B1ubSgoeNa8HWa7DlBZUE2aIGzxa/fMzmsqxGuFWTN4UmNNvz857LoKZijhKS73
 W94vlm1Qry889tH1VHyyOFrX9JT8eFwG7MhxKo7FjHVUfcF+BBtheAs1gHMHk6j0gu9E
 WfdXuX0nSe3jFm/zdabCkUyZfJ8LT0VlVWPqNfZ0F3EJSARY0f7g4rLV6NTdVGhVYN2/
 QMSMwR1GRa57XLDVSV8QRD5YEgvTzLvvY4JcwFLoVZSgzs4Bk3tepYCIUupebUYD42LT
 Xot6pF1h0QXPDL2eB6OEQMDAf7NNzC7Pt6sogOdxstMVGSigs/T26LlTQ1MwZFllXfQ5
 8ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Go1aD/L4/NwaeqwABKS0DOpnE/e7XYIGVtitFbk6RI=;
 b=nj3bBv1I76SVaunAb456rITD+lyDGgADjkGn1jMgE7JtWdSASRNn//o4d1y3eNK6Zx
 nCX6Q0Dct1ygbqEVroHCpDiT3k5cwIKnZGj0oYOBFyFcyztvADhTYiQ42Jk2PB3LVM4v
 KlqAfip8wyF4/RNmHBPDnqYM+O9vgxTSf7MmJ8fFywrZhzUfAFPvctnOinfk9aU9f4C8
 u3WLo+nLjiDvc+HMKFpWG3fzug03UeCBqvkJgL5aSL0Vwj5MK3qJ4LKUm7r+fw1GBnEM
 QRV7k1MyL3mrCaImq274+34oDmn7r4sB1IDaiME2XEFnhCpgx/dwgZwWIUF8Dng6Y2zU
 /V+A==
X-Gm-Message-State: AOAM533SOb5AC8Y+8HhG6Y4WIbioFWoD7XwmLIhrPbSp39Ye32gj2k92
 y+uVvEflH1ZqKQoEVIu6kRg=
X-Google-Smtp-Source: ABdhPJxIFGUTGYOAyPcmNz7UCTfE17jXAclddbJBz9rYIifOloe2Yp+ZX4La1h+1ilezeoi/436n6A==
X-Received: by 2002:a63:8841:0:b0:3db:2e5f:1271 with SMTP id
 l62-20020a638841000000b003db2e5f1271mr7824710pgd.233.1652530150033; 
 Sat, 14 May 2022 05:09:10 -0700 (PDT)
Received: from localhost ([2406:7400:63:532d:c4bb:97f7:b03d:2c53])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a62d104000000b0050dc7628184sm3528728pfg.94.2022.05.14.05.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 05:09:09 -0700 (PDT)
Date: Sat, 14 May 2022 17:39:04 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220514120904.xbbfyne32lp47t2p@riteshh-domain>
References: <20220513231605.175121-1-ebiggers@kernel.org>
 <20220513231605.175121-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513231605.175121-2-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 22/05/13 04:16PM, Eric Biggers wrote: > From: Eric Biggers
 > > If processing the on-disk mount options fails after any memory was >
 allocated in the ext4_fs_context, e.g. s_qf_names, then this me [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ritesh.list[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1npqaB-00068V-N1
Subject: Re: [f2fs-dev] [PATCH v3 1/5] ext4: fix memory leak in
 parse_apply_sb_mount_options()
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 22/05/13 04:16PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> If processing the on-disk mount options fails after any memory was
> allocated in the ext4_fs_context, e.g. s_qf_names, then this memory is
> leaked.  Fix this by calling ext4_fc_free() instead of kfree() directly.

Thanks for splitting the patch. It becomes an easy backport.

>
> Reproducer:
>
>     mkfs.ext4 -F /dev/vdc
>     tune2fs /dev/vdc -E mount_opts=usrjquota=file
>     echo clear > /sys/kernel/debug/kmemleak
>     mount /dev/vdc /vdc
>     echo scan > /sys/kernel/debug/kmemleak
>     sleep 5
>     echo scan > /sys/kernel/debug/kmemleak
>     cat /sys/kernel/debug/kmemleak

Tested this and as you mentioned this patch fixes the memory leak with
s_qf_names in note_qf_name().

tune2fs 1.46.5 (30-Dec-2021)
Setting extended default mount options to 'usrjquota=file'
unreferenced object 0xffff8881126b9a50 (size 8):
  comm "mount", pid 1475, jiffies 4294829180 (age 48.670s)
  hex dump (first 8 bytes):
    66 69 6c 65 00 6b 6b a5                          file.kk.
  backtrace:
    [<ffffffff8153b09d>] __kmalloc_track_caller+0x17d/0x2f0
    [<ffffffff8149b7e8>] kmemdup_nul+0x28/0x70
    [<ffffffff81753a75>] note_qf_name.isra.0+0x95/0x180
    [<ffffffff817548a8>] ext4_parse_param+0xd48/0x11c0
    [<ffffffff8175a131>] ext4_fill_super+0x1cc1/0x6260
    [<ffffffff8155edce>] get_tree_bdev+0x24e/0x3a0
    [<ffffffff81740355>] ext4_get_tree+0x15/0x20
    [<ffffffff8155d3a2>] vfs_get_tree+0x52/0x140
    [<ffffffff815a2048>] path_mount+0x3f8/0xf30
    [<ffffffff815a2c52>] do_mount+0xd2/0xf0
    [<ffffffff815a2e4a>] __x64_sys_mount+0xca/0x110
    [<ffffffff82e6674b>] do_syscall_64+0x3b/0x90
    [<ffffffff8300007c>] entry_SYSCALL_64_after_hwframe+0x44/0xae


Feel free to add by -

Tested-by: Ritesh Harjani <ritesh.list@gmail.com>

-ritesh

>
> Fixes: 7edfd85b1ffd ("ext4: Completely separate options parsing and sb setup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/super.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 1466fbdbc8e34..60fa2f2623e07 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -2625,8 +2625,10 @@ static int parse_apply_sb_mount_options(struct super_block *sb,
>  	ret = ext4_apply_options(fc, sb);
>
>  out_free:
> -	kfree(s_ctx);
> -	kfree(fc);
> +	if (fc) {
> +		ext4_fc_free(fc);
> +		kfree(fc);
> +	}
>  	kfree(s_mount_opts);
>  	return ret;
>  }
> --
> 2.36.1
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
