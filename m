Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C44293F200B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Aug 2021 20:42:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGmzI-00074d-7k; Thu, 19 Aug 2021 18:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mGmzG-00074N-Ge
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 18:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WPfU/kDrGLSLP4a4zrY/H26g0hCkNQbnAALaNtp7Yh0=; b=acmV+sV3BpsKNGJSKrKzoP4KCI
 rAIZWc5FjYiJhyqrDkc/cYtASIeWoX8KonmwdwDGDh8DGHvVIR57gzh2dIdzJvE2SUWVnUsG/juQ9
 BINQTg81eFO3de7ynW3kceN/XMB08rhZMRLqCBc/qziIDpc3NfQhL8XF+HJZe7G59IOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WPfU/kDrGLSLP4a4zrY/H26g0hCkNQbnAALaNtp7Yh0=; b=UtRBJsSnFYeel7OFRghzTkACFA
 b3I8U6GOOlh4bK17qlzn6nM8Th49Ps9dC4jHKkkgPh8SIWiN8brJUXwg9NEJBoEiES3q+UUbg7a/A
 SUVhig6WBkD7HKKHLsiit5nK6X7OaKQNgzkhfI8r4isUKwEgbMtQm6KxyZv6Hjw3RQDM=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mGmzF-0007fm-85
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 18:41:58 +0000
Received: by mail-lf1-f52.google.com with SMTP id x27so14963896lfu.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Aug 2021 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WPfU/kDrGLSLP4a4zrY/H26g0hCkNQbnAALaNtp7Yh0=;
 b=Jk/u76anpcQfoOSuTdGiptbbA1dN+K9x5YFv+HcAeRiMRY5+vkrZjudnHEZJ5Y2NAR
 aoFePFlIQhNZAijKIDX3O/mtMvkBEJVmzKght92UK0xz9aKSTqx8rCDjT36B4a1Ut08R
 itEtdtE/JWV0xJKkD3L2SKwXT0Z1rL0leO9pjE9jFvhiFd/zf6ZdCaqJAay+AWm2l/g8
 U3bcIFAYe4bO81l+Ngwdb2HNLvWnMFK7ffl8ZD6To95fjMcvhPc8kmhLRF9K3/m2ePHd
 69UvUeJtw331OzXCLtKzX3uxCB6O74+BHrvYyyExufXoEoEVll49irXwRYWKDRqfQjvH
 9yIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WPfU/kDrGLSLP4a4zrY/H26g0hCkNQbnAALaNtp7Yh0=;
 b=CKHuM20JlIznO9RQAVryjTkpGN+PEzNs/6ufMmmqndIjRNqoBSxV5oqDcQKQ97p2Kl
 n7lvjtTxbhbe0TEGixJRld3qFJdWnKSa7R5pXzppo0R0FIxGZvZ6KISg8sY6bXXBGx+8
 rjX8A3LlTLnxxJ3z3y3MzQKdzCEkq8Lk8l36ikhkbEZAF+RA/YGf4AbBxIpHEZQy4aRk
 jmudIABSBsaTU8OdkppLn38ssePH9yrbuidy2joDQiE/7dig+EIQSw6sY7FfvQWWdLpy
 sbrLE+s5EQ8AsVDj8W7U/QSeDx+soMNlomes19LIF3IWsFMtmL026lDwlc+y0CADx0h9
 uhWA==
X-Gm-Message-State: AOAM530orIV3FR7v1prGXasaPrEqtwDpje702uHPigmqTHQgpHchsR6y
 cgoqKBcLqyv6Yze0nKATFk931NiXXxGJfg+D4vQ=
X-Google-Smtp-Source: ABdhPJz6qsT6m8I+SuJr93y19YjZt8bjQzOgjEpYuL0VsMGG9vxrR+abU+TNDpzoojtGPe2uE8mRDPXnLRlww98FKVY=
X-Received: by 2002:ac2:4573:: with SMTP id k19mr11429688lfm.622.1629398510690; 
 Thu, 19 Aug 2021 11:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210808215234.1939266-1-daeho43@gmail.com>
In-Reply-To: <20210808215234.1939266-1-daeho43@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 19 Aug 2021 11:41:39 -0700
Message-ID: <CACOAw_xhft1SxJCBSOQ50mQpT3QwKcijJ49wOF5tzVDGdJ=Z+g@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 kernel-team@android.com
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mGmzF-0007fm-85
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: change fiemap print out format
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ping this?

On Sun, Aug 8, 2021 at 2:52 PM Daeho Jeong <daeho43@gmail.com> wrote:
>
> From: Daeho Jeong <daehojeong@google.com>
>
> Given fiemap way to print out extents in the kernel, we can correctly
> print the layout of each file in a unit of extent, not block. So, I
> changed fiemap print out way like below.
>
> Fiemap: offset = 0 len = 60
>         logical addr.    physical addr.   length           flags
> 0       0000000000000000 00000020032df000 0000000000004000 00001008
> 1       0000000000004000 00000020032e0000 0000000000004000 00001008
> 2       0000000000008000 00000020032e1000 0000000000004000 00001008
> 3       000000000000c000 00000020032e2000 0000000000004000 00001008
>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  tools/f2fs_io/f2fs_io.c | 53 ++++++++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 42dbd60..0d2948e 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -731,11 +731,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>  #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>  static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>  {
> -       unsigned count, i;
> -       int fd;
> -       __u64 phy_addr;
> -       struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
> -                       sizeof(struct fiemap_extent));
> +       unsigned int i;
> +       int fd, extents_mem_size;
> +       u64 start, length;
> +       u32 mapped_extents;
> +       struct fiemap *fm = xmalloc(sizeof(struct fiemap));
>
>         if (argc != 4) {
>                 fputs("Excess arguments\n\n", stderr);
> @@ -743,26 +743,41 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>                 exit(1);
>         }
>
> -       fm->fm_start = atoi(argv[1]) * F2FS_BLKSIZE;
> -       fm->fm_length = F2FS_BLKSIZE;
> -       fm->fm_extent_count = 1;
> -       count = atoi(argv[2]);
> +       memset(fm, 0, sizeof(struct fiemap));
> +       start = atoi(argv[1]) * F2FS_BLKSIZE;
> +       length = atoi(argv[2]) * F2FS_BLKSIZE;
> +       fm->fm_start = start;
> +       fm->fm_length = length;
>
>         fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>
> -       printf("Fiemap: offset = %08"PRIx64" len = %d\n",
> -                               (u64)fm->fm_start / F2FS_BLKSIZE, count);
> -       for (i = 0; i < count; i++) {
> -               if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> -                       die_errno("FIEMAP failed");
> +       printf("Fiemap: offset = %"PRIu64" len = %"PRIu64"\n",
> +                               start / F2FS_BLKSIZE, length / F2FS_BLKSIZE);
> +       if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> +               die_errno("FIEMAP failed");
> +
> +       mapped_extents = fm->fm_mapped_extents;
> +       extents_mem_size = sizeof(struct fiemap_extent) * mapped_extents;
> +       free(fm);
> +       fm = xmalloc(sizeof(struct fiemap) + extents_mem_size);
>
> -               phy_addr = fm->fm_extents[0].fe_physical / F2FS_BLKSIZE;
> -               printf("%llu: %llu\n", fm->fm_start / F2FS_BLKSIZE, phy_addr);
> +       memset(fm, 0, sizeof(struct fiemap));
> +       memset(fm->fm_extents, 0, extents_mem_size);
> +       fm->fm_start = start;
> +       fm->fm_length = length;
> +       fm->fm_extent_count = mapped_extents;
>
> -               if (fm->fm_extents[0].fe_flags & FIEMAP_EXTENT_LAST)
> -                       break;
> +       if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> +               die_errno("FIEMAP failed");
>
> -               fm->fm_start += F2FS_BLKSIZE;
> +       printf("\t%-17s%-17s%-17s%s\n", "logical addr.", "physical addr.", "length", "flags");
> +       for (i = 0; i < fm->fm_mapped_extents; i++) {
> +               printf("%d\t%.16llx %.16llx %.16llx %.8x\n", i,
> +                   fm->fm_extents[i].fe_logical, fm->fm_extents[i].fe_physical,
> +                   fm->fm_extents[i].fe_length, fm->fm_extents[i].fe_flags);
> +
> +               if (fm->fm_extents[i].fe_flags & FIEMAP_EXTENT_LAST)
> +                       break;
>         }
>         printf("\n");
>         free(fm);
> --
> 2.32.0.605.g8dce9f2422-goog
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
