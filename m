Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF64DE1D8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Mar 2022 20:38:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nVIQB-0003d1-LI; Fri, 18 Mar 2022 19:37:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daehojeong@google.com>) id 1nVIQA-0003ct-B9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 19:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZS9ok05PYKlNZu1rxfnTOBmw2CBJcOeQT2M61z+cNaM=; b=AvG8jARXUx1AzbYH+U53TQZw1G
 z7QlH/38QYetzpw0GQ1MwBgcpxwq7fBffWfzY0E4HxykhqzW5wxWubm2HB3hvu0xDC7236RTneedU
 LgZy8vqn1iA4irGdwZYkgDjZIfwiQrQ2ob5kxmTjPBk68u046+P//LIJItJTZThuLwAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZS9ok05PYKlNZu1rxfnTOBmw2CBJcOeQT2M61z+cNaM=; b=jey6NhUJja3iUh3uHtxjiteK6D
 U4S15iCSsTsW5suC1E/0WjlASu331FV4bJeEtPLr1DZysNi4mgK0J/5s6Uu7d13e+ly4OYcOFHpgP
 xJ+GhVwR/Uegf4vqKZp3Okd2rn3LRVDn8ea3S1ku4OK7yxP3XizwlrVtpDcrGiyk+/6w=;
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nVIQ4-003OQh-2q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 19:37:56 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so11369937ooj.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Mar 2022 12:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZS9ok05PYKlNZu1rxfnTOBmw2CBJcOeQT2M61z+cNaM=;
 b=jIcNV6Y6FHF5WfQofdJeZLGkRRnKmqhlhP8GAhYV5fqxojJwo/iFsNSPY+BkpqUx7z
 cVnP2eLTY1pfuAozuXk/issL2JSOMhtZA+gPLzBCLnV4X2gfx+e35DiEB0llqIVUxNaw
 zClS82Yj+F+Z+MzHVvIlgQULs/WrocF2gkjtdtohEcYlpq/M9+X+CyeGgwengz0wUlsN
 iQVpXAo54MRxJIry/OK2L2T49djs92Umr4iyRknwjjs9Uw2/moDkBYWu7YyiUGTZRmw2
 lCecRMLp+NgziUvdg1zC8O4201TG6JjJgSb2GpJede3OUOanB2ifRJDxvRCQ3D+3N918
 q3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZS9ok05PYKlNZu1rxfnTOBmw2CBJcOeQT2M61z+cNaM=;
 b=s3iQ+3y77rb/BcHg63EWWzmH010f2g4NSFGTZlAyoJnUxhLOpax7myx/5VP4Ry4MCx
 lP+fkjywABobSAtExKlF0KiWP2p+0pDxDyi5pkuyzgei1HUerYkAY3l0TO/alCCGrnRq
 FPQp8OKmgBhtl8x0Wjbv0o61iBsUiIvaCHRek637c6bSWB4Qnt6gt/dGf4Ulr1kqb+nJ
 dEcwd4+iX2IhG4f8/mCswCGVkXdOkr43O1VabUn6W8dYl9T3HF0kHIqid6QmAXQo6MKE
 b9raJ84gV93/09fgTjOcrs3BJInBrzF7O4R2VhCzU/eH54ffCPG8OEQAc6D1ZDLdkNA3
 smyQ==
X-Gm-Message-State: AOAM531907eWIZxhyLqjy4pMnSaCChalO1ifeEwhh8OSt6Am57+o2/Yv
 g6rBxzA1+F+qJjEj1RNDGbydQFAf3+Tb0ao3aFDsWPfoHxk=
X-Google-Smtp-Source: ABdhPJwtCprt5WfOMNYtaolfRijaJQkSfbdULl/jCbQlU9R26vgNkGVJ0PVOEQw7N6gWxYJnOirUUqEN1URoIj/hfk0=
X-Received: by 2002:a05:6870:58aa:b0:dd:a976:5e8f with SMTP id
 be42-20020a05687058aa00b000dda9765e8fmr5294282oab.112.1647630833948; Fri, 18
 Mar 2022 12:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220318191012.4113266-1-daeho43@gmail.com>
In-Reply-To: <20220318191012.4113266-1-daeho43@gmail.com>
Date: Fri, 18 Mar 2022 12:13:18 -0700
Message-ID: <CABdZyexJoHaymH5Xqn=TcPLf8ek7H9i3vPE=AJz=6Asd=+nAxw@mail.gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Plz, sorry, ignore this one. On Fri, Mar 18, 2022 at 12:10
 PM Daeho Jeong <daeho43@gmail.com> wrote: > > From: Daeho Jeong
 <daehojeong@google.com>
 > > Changed a way of showing values of them to use strings. > > Signed-off-by:
 Dae [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.161.51 listed in list.dnswl.org]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1nVIQ4-003OQh-2q
Subject: Re: [f2fs-dev] [PATCH] f2fs: make gc_urgent and gc_segment_mode
 sysfs node readable
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
From: Daeho Jeong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daeho Jeong <daehojeong@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Plz, sorry, ignore this one.

On Fri, Mar 18, 2022 at 12:10 PM Daeho Jeong <daeho43@gmail.com> wrote:
>
> From: Daeho Jeong <daehojeong@google.com>
>
> Changed a way of showing values of them to use strings.
>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/sysfs.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index fe29bcb70f46..f2613cc83888 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -41,6 +41,16 @@ enum {
>         ATGC_INFO,      /* struct atgc_management */
>  };
>
> +const char *gc_mode_names[MAX_GC_MODE] = {
> +       "GC_NORMAL",
> +       "GC_IDLE_CB",
> +       "GC_IDLE_GREEDY",
> +       "GC_IDLE_AT",
> +       "GC_URGENT_HIGH",
> +       "GC_URGENT_LOW",
> +       "GC_URGENT_MID"
> +};
> +
>  struct f2fs_attr {
>         struct attribute attr;
>         ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);
> @@ -316,8 +326,13 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>                 return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
>  #endif
>
> +       if (!strcmp(a->attr.name, "gc_urgent"))
> +               return sysfs_emit(buf, "%s\n",
> +                               gc_mode_names[sbi->gc_mode]);
> +
>         if (!strcmp(a->attr.name, "gc_segment_mode"))
> -               return sysfs_emit(buf, "%u\n", sbi->gc_segment_mode);
> +               return sysfs_emit(buf, "%s\n",
> +                               gc_mode_names[sbi->gc_segment_mode]);
>
>         if (!strcmp(a->attr.name, "gc_reclaimed_segments")) {
>                 return sysfs_emit(buf, "%u\n",
> --
> 2.35.1.894.gb6a874cedc-goog
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
