Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09B1FD5D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 22:14:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jleS2-00082V-3H; Wed, 17 Jun 2020 20:14:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jleS0-00082F-BS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 20:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/gPu7TMycBU2OMmKICnzUSp+xjDAAHE5ZCXBHSedrA=; b=bcI78F0/N50gEedDMduCv4kpve
 LR7OeeEB7i/3ReA71peli6l54XqCt8nw4UaJl7D+I2giLNrQWARmuUDXrxahXxD6hj69p2yA6uyIM
 a5xreVcUq5L86JXkSJX3Eo30ARKVJ5suiGKgdfZzw81rfgrgPSRY1UBlcr1ZTffcJj4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/gPu7TMycBU2OMmKICnzUSp+xjDAAHE5ZCXBHSedrA=; b=TELFq3AC9ksC4WVANIjQAZBIO8
 11DJIUnIZxI2HFkopmWOtnRWpczzE6TzuhxUvT5J6Km2Zb44O8DJ8YAm6lgPKXE6Q0z3K6mkdd/cW
 egfxBqB6+ERgbBOFeHTRZr6mH2EYkGHUOuDNvJWGSdB+Gv2xheRL1feDvXYug6z9YfYY=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jleRv-007NFm-Hs
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 20:14:24 +0000
Received: by mail-lj1-f194.google.com with SMTP id i3so4504499ljg.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 13:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/gPu7TMycBU2OMmKICnzUSp+xjDAAHE5ZCXBHSedrA=;
 b=Hgg/nMoOfC6xMGf+J0M+j/XoZSAzvWUNAJO5oRrnxxQZz6Jmm0bdH9VjaHmTQ4XPAi
 n/s9J0wSZAWbIYX//BzBFy8dbEnTocLEWX0efF+Wc/Hi97+M0oDVNjosY09MY8AutLO8
 qpGLDMUievYu4q8rJPW79V9RO2lnQiRDoKZYOwvNwTOtAoz3Y1Yf4CYHpoxy71/O111x
 XyKu9yBw7Y6GEAQ6DbuX1G6elk8UAN33ZXvp/hMJY42Wbp16m3kGTmL6w9UxFO2mTphj
 NMM0Gh4+agGODtkiA7pegz8sjaNYzBN5MFM1gmXwuuNuXozNRhBVA/6Ak0mguCvAdC5y
 uIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/gPu7TMycBU2OMmKICnzUSp+xjDAAHE5ZCXBHSedrA=;
 b=WL+bepLMfaWIHlEeeD3afYvkQGHqOJ2isfGpZar6ISRZTEUdLBfxqpV2O0m1bn4bpY
 ls6OxGKP8+FHKmp7yW4EYSdzh6e1SbKtcpvF3gvaL2uPA1OS0WOzuNlEDCpTpGsrcf7D
 PxTslwqmiwoOw1Y5y+XvNRbxtS0msrdSgxx/SxYyEx5jl/uf1ygOrXIyDguh2sW5N28E
 2CdfuqPkH5KB/g1QoKwyltn+xBhNKCO5Vsg8UPjqstekxklHMk0Kp3UsyHQVCfrWhh0g
 Ml4UtKWWOzrq/ISpa1ruu1ChWLDBehrLdAW7zmKY+tN4PsurDXErGuWYU11WczNYlTpw
 uxBg==
X-Gm-Message-State: AOAM533OFi/kf/DF3bwg9TmgZZgeqFEx4o4kuwgJKV2/l6xpS+udWQHu
 /jvDxmhiTwa1M0d4chwUfbzRulKf9CqV7dFhweg3AQ==
X-Google-Smtp-Source: ABdhPJxu/rE2rptP5d+WfyaHgfX2ttcXAh33IxS8fL6XLG7WEVYacg0tdg5G22BFQHF/I4DoFwlWnsCjNWKyglTnJas=
X-Received: by 2002:a2e:974e:: with SMTP id f14mr480197ljj.102.1592424845650; 
 Wed, 17 Jun 2020 13:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
 <20200617141155.GQ9499@dhcp22.suse.cz>
 <CA+G9fYu+FB1PE0AMmE-9MrHpayE9kChwTyc3zfM6V83uQ0zcQA@mail.gmail.com>
 <20200617160624.GS9499@dhcp22.suse.cz>
In-Reply-To: <20200617160624.GS9499@dhcp22.suse.cz>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 18 Jun 2020 01:43:53 +0530
Message-ID: <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>, Chris Down <chris@chrisdown.name>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jleRv-007NFm-Hs
Subject: Re: [f2fs-dev] mm: mkfs.ext4 invoked oom-killer on i386 -
 pagecache_get_page
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
Cc: lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
 Yafang Shao <laoar.shao@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, open list <linux-kernel@vger.kernel.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 17 Jun 2020 at 21:36, Michal Hocko <mhocko@kernel.org> wrote:
>
> On Wed 17-06-20 21:23:05, Naresh Kamboju wrote:
> > On Wed, 17 Jun 2020 at 19:41, Michal Hocko <mhocko@kernel.org> wrote:
> > >
> > > [Our emails have crossed]
> > >
> > > On Wed 17-06-20 14:57:58, Chris Down wrote:
> > > > Naresh Kamboju writes:
> > > > > mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8RQK14KF6XF
> > > > > mke2fs 1.43.8 (1-Jan-2018)
> > > > > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > > > > Filesystem UUID: 7c380766-0ed8-41ba-a0de-3c08e78f1891
> > > > > Superblock backups stored on blocks:
> > > > > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > > > > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > > > > 102400000, 214990848
> > > > > Allocating group tables:    0/7453 done
> > > > > Writing inode tables:    0/7453 done
> > > > > Creating journal (262144 blocks): [   51.544525] under min:0 emin:0
> > > > > [   51.845304] under min:0 emin:0
> > > > > [   51.848738] under min:0 emin:0
> > > > > [   51.858147] under min:0 emin:0
> > > > > [   51.861333] under min:0 emin:0
> > > > > [   51.862034] under min:0 emin:0
> > > > > [   51.862442] under min:0 emin:0
> > > > > [   51.862763] under min:0 emin:0
> > > >
> > > > Thanks, this helps a lot. Somehow we're entering mem_cgroup_below_min even
> > > > when min/emin is 0 (which should indeed be the case if you haven't set them
> > > > in the hierarchy).
> > > >
> > > > My guess is that page_counter_read(&memcg->memory) is 0, which means
> > > > mem_cgroup_below_min will return 1.
> > >
> > > Yes this is the case because this is likely the root memcg which skips
> > > all charges.
> > >
> > > > However, I don't know for sure why that should then result in the OOM killer
> > > > coming along. My guess is that since this memcg has 0 pages to scan anyway,
> > > > we enter premature OOM under some conditions. I don't know why we wouldn't
> > > > have hit that with the old version of mem_cgroup_protected that returned
> > > > MEMCG_PROT_* members, though.
> > >
> > > Not really. There is likely no other memcg to reclaim from and assuming
> > > min limit protection will result in no reclaimable memory and thus the
> > > OOM killer.
> > >
> > > > Can you please try the patch with the `>=` checks in mem_cgroup_below_min
> > > > and mem_cgroup_below_low changed to `>`? If that fixes it, then that gives a
> > > > strong hint about what's going on here.
> > >
> > > This would work but I believe an explicit check for the root memcg would
> > > be easier to spot the reasoning.
> >
> > May I request you to send debugging or proposed fix patches here.
> > I am happy to do more testing.
>
> Sure, here is the diff to test.
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index c74a8f2323f1..6b5a31672fbe 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -392,6 +392,13 @@ static inline bool mem_cgroup_below_low(struct mem_cgroup *memcg)
>         if (mem_cgroup_disabled())
>                 return false;
>
> +       /*
> +        * Root memcg doesn't account charges and doesn't support
> +        * protection
> +        */
> +       if (mem_cgroup_is_root(memcg))
> +               return false;
> +
>         return READ_ONCE(memcg->memory.elow) >=
>                 page_counter_read(&memcg->memory);
>  }
> @@ -401,6 +408,13 @@ static inline bool mem_cgroup_below_min(struct mem_cgroup *memcg)
>         if (mem_cgroup_disabled())
>                 return false;
>
> +       /*
> +        * Root memcg doesn't account charges and doesn't support
> +        * protection
> +        */
> +       if (mem_cgroup_is_root(memcg))
> +               return false;
> +
>         return READ_ONCE(memcg->memory.emin) >=
>                 page_counter_read(&memcg->memory);
>  }


After this patch applied the reported issue got fixed.

test log link,
https://lkft.validation.linaro.org/scheduler/job/1505417#L1429

- Naresh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
