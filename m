Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6081DBFE0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2020 22:06:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbUyq-0003PO-6M; Wed, 20 May 2020 20:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris@chrisdown.name>) id 1jbUyo-0003PH-Mb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 20:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tl5hNSaq9jwtAfQ3H4b6ZmG+ScLEKqnmbeQTtX38GBs=; b=AgFSRAZ+5XmNBYYgJScgZcS8Kb
 nXvMRX/t4R3EQOf2mo4ZwkQoE7P9w61mq7n+J+j6DRtfIJidJGLpQS6zEJEJecFoma2VV03hgMdCF
 kWk8J5ioSrmx+SKjJPrv12mITTQUCuX+N0M6KJgAFUgpsp6Wc5N7lCmdW5L9gzj2f+EA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tl5hNSaq9jwtAfQ3H4b6ZmG+ScLEKqnmbeQTtX38GBs=; b=Mi9oXbXmTLsqSQJiFAeVIUjr1P
 Sqp26ZNN5fr49LQW2v5hzH7MSai7UukHptZyN3Wk2qywZsQgy4aBqjZ76HdWsi25UeEmmVVhAqscz
 fS9ZcuozRUb/+p8G22FYLmGBbjapuBq8bqvXETq1mFfczIbeAyygKtbH7ZIsjAH/TG5o=;
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbUyl-002TJz-2t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 20:06:18 +0000
Received: by mail-ed1-f68.google.com with SMTP id i16so4560439edv.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2020 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tl5hNSaq9jwtAfQ3H4b6ZmG+ScLEKqnmbeQTtX38GBs=;
 b=ejWrZ/jfJqN1W3XBa5rEh8Lk4R2pGtjUsAfERal12GI7QfCZfWLDd9UtMrTSYE1/tI
 FovDCSwIGfbaaHj8cZJ1IKJDULyXaqYHAyGtIE65kUKbthWtIjz/KQGrx+y85v2kRRQb
 81QOjyfbBp6VHvsSe4y3k88jU+q/CRx/ohQyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tl5hNSaq9jwtAfQ3H4b6ZmG+ScLEKqnmbeQTtX38GBs=;
 b=B0PB3B2PktFkTgJy8scqdoAmsIARkpDGp4HnzYfW5pm//0z8oRNvLTVHaTtH6FEXiE
 0OIACfBColRe8Nc6g2qznx2ukX8hgBLZpuXPhLB98aFvrLpnB820AUaDC+v40C6LuK2l
 Ux3lQAZag50j7kxJcDXeqIYf6tm/riF/B5tN4dKyasY0jtMbeEhTzN7rKcwYdDZ0WULT
 FHqlkcDq0e0dOpmXtb4k7qB7JZEyw6Vj9dUFqTkG/pjaRl2/tn1g+JO0CJM7TTO8UF3o
 LgD0SRNNy1HoIsDw+7nFrbv9d2nFtFkJzzh7UcjfdLGDhz1nAbBqHCW8olCDJbJI0ryZ
 iBWQ==
X-Gm-Message-State: AOAM53162qv4xeqngNCS4xuEKs0QWQNrBMpMQMgSQgE+qRZgTpX6l/jD
 71MEbfg7nYp6Jel2DJkx5TlNDarH1uipF5is
X-Google-Smtp-Source: ABdhPJweTP3W62AzAZrqweXxsUYkSWvtaZ1Wr8JxuA7F/wzgya+W3/hBf6pFGJ7YDBt9fmp3P99NeQ==
X-Received: by 2002:a50:9312:: with SMTP id m18mr4674386eda.252.1590001748698; 
 Wed, 20 May 2020 12:09:08 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:758d])
 by smtp.gmail.com with ESMTPSA id g21sm2514869edw.9.2020.05.20.12.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 12:09:08 -0700 (PDT)
Date: Wed, 20 May 2020 20:09:06 +0100
From: Chris Down <chris@chrisdown.name>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200520190906.GA558281@chrisdown.name>
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jbUyl-002TJz-2t
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
Cc: lkft-triage@lists.linaro.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Yafang Shao <laoar.shao@gmail.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, cgroups@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, open list <linux-kernel@vger.kernel.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Naresh,

Naresh Kamboju writes:
>As a part of investigation on this issue LKFT teammate Anders Roxell
>git bisected the problem and found bad commit(s) which caused this problem.
>
>The following two patches have been reverted on next-20200519 and retested the
>reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
>( invoked oom-killer is gone now)
>
>Revert "mm, memcg: avoid stale protection values when cgroup is above
>protection"
>    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
>
>Revert "mm, memcg: decouple e{low,min} state mutations from protection
>checks"
>    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.

Thanks Anders and Naresh for tracking this down and reverting.

I'll take a look tomorrow. I don't see anything immediately obviously wrong in 
either of those commits from a (very) cursory glance, but they should only be 
taking effect if protections are set.

Since you have i386 hardware available, and I don't, could you please apply 
only "avoid stale protection" again and check if it only happens with that 
commit, or requires both? That would help narrow down the suspects.

Do you use any memcg protections in these tests?

Thank you!

Chris


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
