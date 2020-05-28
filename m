Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1A1E67C0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 18:49:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeLiz-0006vV-UK; Thu, 28 May 2020 16:49:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris@chrisdown.name>) id 1jeLiz-0006vI-3K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 16:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pvf7qBFEHIiAL/UpG9xM7Gf8VhxhCVBHlvWj3inRLaM=; b=Rbk/h1bGV7MKzogKUXAxTOyAEg
 H+Gw9u/dRvlBVaeLJsBruEfwrtT8slVxgVPiXY/jh4mrTTJIhh6uuTYxi1ssBI9IkPkPdhyHNoHVQ
 SGp9GacJGGUTmKZ4FA2HPxwuFRf7jrN9s+d2i7+l7IoF2ynPNNbwa6LWb2XnUeHb+Klk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pvf7qBFEHIiAL/UpG9xM7Gf8VhxhCVBHlvWj3inRLaM=; b=JEUn6GhVCyIXQ5dnPBcKpj9bem
 pO85XlxgGnRw5yOqS9txtX/w1jxSnePTIuZbp7iPo73RwVBKh3yp+IEPvPoFgqpZIXSOpkIMLSvHU
 +ZdYOgfKHeWHBdZbhy7Bn3hRYa1dk57/ME8lt8BwU5tmHOqKDZ/FpOQS9fdJyrDq6rqc=;
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeLis-00B3TC-QK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 16:49:45 +0000
Received: by mail-ed1-f65.google.com with SMTP id k19so619476edv.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2020 09:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pvf7qBFEHIiAL/UpG9xM7Gf8VhxhCVBHlvWj3inRLaM=;
 b=dZ/4oQHkI3iFVl6Q4XDatBaCWT8WDKIy43ty6iL5UZV9y8w2Mwc2zwtaHwr00vostz
 c8tS4BvevPCZZt4NdTss07rL4pzKusdIZLJ1Zm9Z3FuwwbTD2hfas29vKN5+7iQ8CBt4
 fMhXjwXce9iKSnXnt3Jr4qQvtVDCYiR2OFQFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pvf7qBFEHIiAL/UpG9xM7Gf8VhxhCVBHlvWj3inRLaM=;
 b=XvpXO5o7sz4OJf+rEvn82vrWLSRoLgNlaad+Y2Gf4M/vk2y2dS5xZUmVqIHqqbQmhq
 /GZ9KpOxADeUV9UkdXDy4lDP6vzkKtsA0fp8xhwikCqvFAWN0MUhDsVr7hKgZKId6wCa
 9EsvVoXxcGV16wW4IZN15J6i6ZXlmvQ0e7NVS87KAHpa+nsfbkTtmuokjNP5zSqcRsnU
 KDnINxuI0blgklQ9pMMZIoFN6mSmCYrx9ArMDzOvL55wxma2QUrzCxCD0l8ldNeTB6rC
 5kPufzelGIZZ1i44V59WVD9cYsxInV9qOXrJrIWMkmRpcejY6LOoeQwv1ix1akPK8k5r
 a+Wg==
X-Gm-Message-State: AOAM530TNi7yv78F49daAD/u+uPwgdEdAeDvwKB4aQv9/hk81N4DU6AT
 tLYjSGv5tlS+X1NeLKqHdTOeUk3qrnqwD54V
X-Google-Smtp-Source: ABdhPJx43EFGY79zZc9WHOq4nlucrHubXscZYsQcdCStmKVBziBJ4zuFJn23rjI3pradupO/1Tk0Ig==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr4130619wrr.375.1590684083033; 
 Thu, 28 May 2020 09:41:23 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:d125])
 by smtp.gmail.com with ESMTPSA id y66sm6698899wmy.24.2020.05.28.09.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 09:41:22 -0700 (PDT)
Date: Thu, 28 May 2020 17:41:21 +0100
From: Chris Down <chris@chrisdown.name>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200528164121.GA839178@chrisdown.name>
References: <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
 <20200528150310.GG27484@dhcp22.suse.cz>
 <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
User-Agent: Mutt/1.14.2 (2020-05-25)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jeLis-00B3TC-QK
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
 Andreas Dilger <adilger.kernel@dilger.ca>, Cgroups <cgroups@vger.kernel.org>,
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

Naresh Kamboju writes:
>On Thu, 28 May 2020 at 20:33, Michal Hocko <mhocko@kernel.org> wrote:
>>
>> On Fri 22-05-20 02:23:09, Naresh Kamboju wrote:
>> > My apology !
>> > As per the test results history this problem started happening from
>> > Bad : next-20200430 (still reproducible on next-20200519)
>> > Good : next-20200429
>> >
>> > The git tree / tag used for testing is from linux next-20200430 tag and reverted
>> > following three patches and oom-killer problem fixed.
>> >
>> > Revert "mm, memcg: avoid stale protection values when cgroup is above
>> > protection"
>> > Revert "mm, memcg: decouple e{low,min} state mutations from protectinn checks"
>> > Revert "mm-memcg-decouple-elowmin-state-mutations-from-protection-checks-fix"
>>
>> The discussion has fragmented and I got lost TBH.
>> In http://lkml.kernel.org/r/CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com
>> you have said that none of the added tracing output has triggered. Does
>> this still hold? Because I still have a hard time to understand how
>> those three patches could have the observed effects.
>
>On the other email thread [1] this issue is concluded.
>
>Yafang wrote on May 22 2020,
>
>Regarding the root cause, my guess is it makes a similar mistake that
>I tried to fix in the previous patch that the direct reclaimer read a
>stale protection value.  But I don't think it is worth to add another
>fix. The best way is to revert this commit.

This isn't a conclusion, just a guess (and one I think is unlikely). For this 
to reliably happen, it implies that the same race happens the same way each 
time.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
