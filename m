Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE23D3266
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:56:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6mIM-0002h0-Ri; Fri, 23 Jul 2021 03:56:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chaoliu719@gmail.com>) id 1m6mIL-0002go-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4CILyKiyZ9Cyy/Achhyq3C7m86Us0H0wmdQwbCBhk7s=; b=Cds9cLxNoUMQKZAL1jAtCgAMDV
 MUV6A0eGlLImBPJJzuli7eEl0yEydBD1PPb0KVzJSO7QPqN4pzAHqZTWkWCxMkGhZuSvscF8NOc+f
 1ObIwieh9JLi5vj/GPVs1AZ2J6sUHlgtfPIotSQ1qLjpUpDIAASyy/0xxGf6B1RlZspY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4CILyKiyZ9Cyy/Achhyq3C7m86Us0H0wmdQwbCBhk7s=; b=kclccFAiS0GndSH47K2M+EMlcW
 aMCF027wmm1xzD22B9QuZ1pNNB5plJF4qNUs44VYemcKxPwsbYbaHojCQG9ovt2XgBJ6K5TOfa5y+
 lYYmuKIJWYmg3rjwcKq//ae4c33bXcZNDoJvgH+I+Rjw0kyStI3c8R8Bj6nDqR/DFRso=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6mIA-00HTmA-4A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:56:17 +0000
Received: by mail-lf1-f43.google.com with SMTP id v6so11783123lfp.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 20:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4CILyKiyZ9Cyy/Achhyq3C7m86Us0H0wmdQwbCBhk7s=;
 b=VwtvKVgL5/N4lanX2A2VRo1qXku2gUfEVD2s/U5WlPiq9OFziJ+BtHZMXR/MRdv16y
 /1L63/rJZ41A0Wl77mLrcCV6BaW9dTV6A8qol6JfhV254/wpSpEvo1JFbMisVS4vwo9x
 XcEzjBUTVDmWl3+Jv4LwacjbtdtJ4BliaISdwDNxazEY9OVmqnDShwSsyaDByuRNcijc
 jOVGddAudOJzm8EpZFNF9YfFbsIcP1LxWFgmHTNAqAh5Wy9aPiN2WrytSS+DiF/blwx2
 QRwRQxcg8Ku1g+3Bzs5PjRcC1qn9EWV5/Zjrl2C8BYQrU7Q7zsYP0QoF5I/mSa089ThI
 I3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4CILyKiyZ9Cyy/Achhyq3C7m86Us0H0wmdQwbCBhk7s=;
 b=ljICm2a8IXpexybABoc6Fn2IRIPQvwu2z5ZqFWT1kkemzz3mqYEE+lJ6vKdViumvkT
 MChQ5U1jugAm4j78rtBPTeKVPucWBMGVeCK0cQvD+cZD8qaSd+IbxjjvUEIxePvEl1A4
 NFF7fwrOnXMGVOuCMQ3sx9AFFOhbXT+IM0VYhJHzpjR0N9n9qFNxfh+V+hEe/g0eD6h9
 b1fpoiBnp89inAYDvU2rD1lEF/j2NppcnHeZ79WZQwixK6rZNR1ISJ0AJy6L/kcQxt+2
 dyqb8oIl6ZL8amupZbPVX4Fk9PUiZAkd6IoYhs6fr7Kkz4/Z9rRA9laJ6nh/6kwm4Gb4
 OK1Q==
X-Gm-Message-State: AOAM531Lz0s8QF9YjCUK4nNk2KQeSx9Ww+9NHa9uK5LePLJNRL26nt3J
 2Doe+B4/VDoKupGNuuIt5U2ZSW7kQw6apv2ew2U=
X-Google-Smtp-Source: ABdhPJxQCkbhChbxfF8wgnof5n2r5pMNP76Vlr2+k91tH7qvXsi7ccr+B1Bssgyt3RPfcUTXpvPQ5LS9+oTH3Ig/alQ=
X-Received: by 2002:a19:f018:: with SMTP id p24mr1771467lfc.162.1627012559512; 
 Thu, 22 Jul 2021 20:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210723034622.1820891-1-liuchao12@xiaomi.com>
In-Reply-To: <20210723034622.1820891-1-liuchao12@xiaomi.com>
From: Chao Liu <chaoliu719@gmail.com>
Date: Fri, 23 Jul 2021 11:55:48 +0800
Message-ID: <CAKaaq-XC8v25_vHwtHgob5QZ+FW5t2mvopTGO7fB1XViyoqNrQ@mail.gmail.com>
To: chao@kernel.org, jaegeuk@kernel.org
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (chaoliu719[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (chaoliu719[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6mIA-00HTmA-4A
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: add option to manually specify
 new overprovision
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sorry, I forgot to add the f2fs-dev label. I will send it again later.

On Fri, Jul 23, 2021 at 11:46 AM Chao Liu <chaoliu719@gmail.com> wrote:
>
> Make.f2fs supports manually specifying overprovision, and we expect
> resize.f2fs to support it as well.
>
> This change add a new '-o' option to manually specify overprovision.
>
> Signed-off-by: Chao Liu <liuchao12@xiaomi.com>
> ---
>  fsck/main.c   | 8 ++++++--
>  fsck/resize.c | 9 ++++++++-
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/fsck/main.c b/fsck/main.c
> index 260ff29..06253e2 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -124,7 +124,8 @@ void resize_usage()
>         MSG(0, "[options]:\n");
>         MSG(0, "  -d debug level [default:0]\n");
>         MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
> -       MSG(0, "  -s safe resize (Does not resize metadata)");
> +       MSG(0, "  -o overprovision percentage [default:auto]\n");
> +       MSG(0, "  -s safe resize (Does not resize metadata)\n");
>         MSG(0, "  -t target sectors [default: device size]\n");
>         MSG(0, "  -V print the version number and exit\n");
>         exit(1);
> @@ -529,7 +530,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  #endif
>         } else if (!strcmp("resize.f2fs", prog)) {
>  #ifdef WITH_RESIZE
> -               const char *option_string = "d:fst:iV";
> +               const char *option_string = "d:fst:io:V";
>
>                 c.func = RESIZE;
>                 while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -563,6 +564,9 @@ void f2fs_parse_options(int argc, char *argv[])
>                         case 'i':
>                                 c.large_nat_bitmap = 1;
>                                 break;
> +                       case 'o':
> +                               c.new_overprovision = atof(optarg);
> +                               break;
>                         case 'V':
>                                 show_version(prog);
>                                 exit(0);
> diff --git a/fsck/resize.c b/fsck/resize.c
> index 78d578e..85a53c5 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -146,7 +146,9 @@ safe_resize:
>                                                 get_sb(segs_per_sec));
>
>         /* Let's determine the best reserved and overprovisioned space */
> -       c.new_overprovision = get_best_overprovision(sb);
> +       if (c.new_overprovision == 0)
> +               c.new_overprovision = get_best_overprovision(sb);
> +
>         c.new_reserved_segments =
>                 (2 * (100 / c.new_overprovision + 1) + 6) *
>                                                 get_sb(segs_per_sec);
> @@ -476,6 +478,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>         set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
>                                                 get_cp(rsvd_segment_count));
>
> +       MSG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
> +       MSG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
> +                                       get_cp(overprov_segment_count),
> +                                       c.new_reserved_segments);
> +
>         free_segment_count = get_free_segments(sbi);
>         new_segment_count = get_newsb(segment_count_main) -
>                                         get_sb(segment_count_main);
> --
> 2.32.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
