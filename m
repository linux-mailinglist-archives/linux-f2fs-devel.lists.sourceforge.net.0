Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAA7660F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 03:03:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPBsj-0001g9-8X;
	Fri, 28 Jul 2023 01:03:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qPBse-0001g2-E3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 01:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8CTrna5t3S7P99W+zrM1I2ApZYIkXTVQedDFVAI6oIw=; b=d8MbkfEKYSfUchyrTrwv6UkKG4
 bj8Z76QApKhrgM3IMFe3R8m0fSX8/1CxKKd85DkSRj5bMYfY95D6VvKfwpE1LCb6QM6GBGE9FAY7S
 8PmDth18W3OZ87D6dZGQbvMXpz813+DOPWnqZKMGHuj046Yjgu5Ro2Ja4KBe75K27RPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8CTrna5t3S7P99W+zrM1I2ApZYIkXTVQedDFVAI6oIw=; b=j/bWtnr1+xVfPGor+DH1IfJ2wk
 NBx5bGV2cHKadrwolN4ZS+Hnl0PqlO3sr6WwfWPZz0Gbqt7dE5PRpHKpe5C4QfIU+PQZVtUhT5QVb
 GP+BO2B2lnecFBLiTyGnsSXmTbBLOSOUyd7WF1ZwajKF9MvXsVwsDZOl2DayWHUTPChQ=;
Received: from mail-yw1-f169.google.com ([209.85.128.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qPBsX-0055K9-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 01:02:56 +0000
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-576a9507a9bso39700687b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 18:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1690506163; x=1691110963;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8CTrna5t3S7P99W+zrM1I2ApZYIkXTVQedDFVAI6oIw=;
 b=3l883+chHpMKGAFA7e7WW6pHJsVKhrkBuAt2lHsHI0TNhpLDIKaiW/iluqqYDQdHlP
 q9kMGj41/FPtT1IGfJNSiXopo5UBtzKkr2IWxLFXSHb9r8ToGMWQGIoIrPbXKlqKcg+N
 vWo3dxRavCGaY2o+OqOh9Rl64DZMgprk/MMr01g5kAr8Glsynt0hQxiCnaNHsxEP4/HB
 Cfx8/j37QMdEa+gle8ByM7fnOiYsoVldXZjyCNRXBjED/tkPW8hnY5w7iw7B9pJnPuOV
 evCM1NDcwMPg4Bp9q1PE4FsE6eAm5x8LXdr9UoVv80ULyq/3R0x5I4M0FGI2+Z5Hq/6x
 jXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690506163; x=1691110963;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8CTrna5t3S7P99W+zrM1I2ApZYIkXTVQedDFVAI6oIw=;
 b=Z3/BBmdWQGgQPDLfX0d0JxWA5C/ye5ijReYrdsb9tTo4vmcHlHhwMuayyYc/HjpsPo
 rtkoiagx6a4m9c+YWyTPuPBKB4gC3NyoJF7mzWmIqfSndE5aL5a16Afn8elTF5H+GgGn
 eIGc0lU7Kk5hnCy7kxBLmRIUJrjV8qihYDtYtCUr6lQWugPoMTjNXek0Rk3w3qn7anep
 Nk8JzRUAjTl5TbnGBqnmJOHzwdTT2Nyc0KdX/wGbxkWpkMlJ/9PqhFTjdUppXkot0OXI
 cRJUQE8rN32VtmFhd/5cXgHnveWGXbD15yHJLVvGsWr0J+SoenrJDRy1V702RDVCuR+8
 q6qQ==
X-Gm-Message-State: ABy/qLbWow023uS9sJS54FoZCbYqKtOR+YWN67kCfd0TcP6UzxsPk023
 YH0jKZHfK2e4UP6bCQDFup6LrO/jjQ88+HNGxXA=
X-Google-Smtp-Source: APBJJlGFE8oAcAZu2XvzWjC5bjR81v7OIjjTfZ8m+EaEe6Rjpq3cuwvHN3I08mErFwOZJpneP9Ly1g==
X-Received: by 2002:a05:6a00:17a8:b0:64d:42b9:6895 with SMTP id
 s40-20020a056a0017a800b0064d42b96895mr61072pfg.5.1690498780930; 
 Thu, 27 Jul 2023 15:59:40 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au.
 [49.186.119.116]) by smtp.gmail.com with ESMTPSA id
 p24-20020aa78618000000b0068702b66ab1sm1115813pfn.174.2023.07.27.15.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:59:40 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qP9xJ-00BKKZ-1O;
 Fri, 28 Jul 2023 08:59:37 +1000
Date: Fri, 28 Jul 2023 08:59:37 +1000
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <ZML22YJi5vPBDEDj@dread.disaster.area>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jul 27, 2023 at 07:20:46PM +0900, Damien Le Moal wrote:
    > On 7/27/23 17:55, Qi Zheng wrote: > >>>           goto err; > >>>      
    } > >>>   +    zmd->mblk_shrinker->count_objects = dmz_mblock_ [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.169 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qPBsX-0055K9-EJ
Subject: Re: [f2fs-dev] [PATCH v3 28/49] dm zoned: dynamically allocate the
 dm-zoned-meta shrinker
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 07:20:46PM +0900, Damien Le Moal wrote:
> On 7/27/23 17:55, Qi Zheng wrote:
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err;
> >>> =A0=A0=A0=A0=A0 }
> >>> =A0 +=A0=A0=A0 zmd->mblk_shrinker->count_objects =3D dmz_mblock_shrin=
ker_count;
> >>> +=A0=A0=A0 zmd->mblk_shrinker->scan_objects =3D dmz_mblock_shrinker_s=
can;
> >>> +=A0=A0=A0 zmd->mblk_shrinker->seeks =3D DEFAULT_SEEKS;
> >>> +=A0=A0=A0 zmd->mblk_shrinker->private_data =3D zmd;
> >>> +
> >>> +=A0=A0=A0 shrinker_register(zmd->mblk_shrinker);
> >>
> >> I fail to see how this new shrinker API is better... Why isn't there a
> >> shrinker_alloc_and_register() function ? That would avoid adding all t=
his code
> >> all over the place as the new API call would be very similar to the cu=
rrent
> >> shrinker_register() call with static allocation.
> > =

> > In some registration scenarios, memory needs to be allocated in advance.
> > So we continue to use the previous prealloc/register_prepared()
> > algorithm. The shrinker_alloc_and_register() is just a helper function
> > that combines the two, and this increases the number of APIs that
> > shrinker exposes to the outside, so I choose not to add this helper.
> =

> And that results in more code in many places instead of less code + a sim=
ple
> inline helper in the shrinker header file...

It's not just a "simple helper" - it's a function that has to take 6
or 7 parameters with a return value that must be checked and
handled.

This was done in the first versions of the patch set - the amount of
code in each caller does not go down and, IMO, was much harder to
read and determine "this is obviously correct" that what we have
now.

> So not adding that super simple
> helper is not exactly the best choice in my opinion.

Each to their own - I much prefer the existing style/API over having
to go look up a helper function every time I want to check some
random shrinker has been set up correctly....

-Dave.
-- =

Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
