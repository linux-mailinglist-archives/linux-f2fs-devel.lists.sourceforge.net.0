Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5611FDFBD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 03:43:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jljap-0003lb-03; Thu, 18 Jun 2020 01:43:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <laoar.shao@gmail.com>) id 1jljan-0003lQ-7g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/NV0zNhM4fAGBEvR6pS4jubz62WIXqxLs8Qbcn4M8G8=; b=kGa06wxeZdlnvaYJxGORVowrxX
 OyY3vSO7yYr4hEE0tq/Ym79yrkOsSz6HMV7enELiM4wwMrygNeESkFWH6Uqfm7fKvUyNdJjBM2TG3
 9Rh9XgBN8LtBFpbF7ySRSNBYGADxt70CH0k6Uykeqk/uuGx+4QTyvklZWV6UgR2zj7YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/NV0zNhM4fAGBEvR6pS4jubz62WIXqxLs8Qbcn4M8G8=; b=G8UhVGlZjIyBQA/JnBA2xypVZR
 5yEG+tz1e3nTF14C5YE7N+qKPuZx5QG0heaJpEwb7TDeuN8+iMBiWLjgay9evucdG1NUSQJUv16t8
 mFVAROh8yl+RZI8FFZtGeMFc0MRWjh7cTmVRYk1+4dT9V8Q242qUelaSlbcBplVa95bI=;
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jljak-0072kG-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:43:49 +0000
Received: by mail-il1-f181.google.com with SMTP id z2so4283708ilq.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 18:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NV0zNhM4fAGBEvR6pS4jubz62WIXqxLs8Qbcn4M8G8=;
 b=dDcozoF3gjERlnIYD/aopfiDz8+Xk7wB85tQ+JG+fS/wcxWZRWOO9ndR3j6DlLjase
 pakWhsVPQ1s1RE4tdxVgckkmbgQQmy7KzyUVIgo8XiewLQf5iDAQQHzmV55SqyA3ni0l
 UhO1lJ4tnxN9yr+l1R5SlEBFs6N7bGO1IezGVFxCOKnzKhYGlAd0C60gF1lzq5zPgtZ5
 9JgAPTH5CwMDcYYdYBRFRY59OOo2Ufb2xXI6CZ33SNJk34h80UPpZg/jdNoIWaOmSADF
 HprtPmsk/lgc7E5A+WM5WfU02YavO+ic/3qkx+0n65e7+GL5yWyxbhFZWUcj97Z490uK
 AJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NV0zNhM4fAGBEvR6pS4jubz62WIXqxLs8Qbcn4M8G8=;
 b=rhPqjZgpkvMPnbGIGQix+3hJJ3WArUQSOw2ZV6PRv6PnKA7eOhEdN0Lrd9y/ngQfCV
 Gqr7H+A+j6JO68c14Xz3rfg/jOCLwO5AMgwKaSecp1czqjh3mqrVp4cjpUwzAgRh1kuf
 oKJbZWt10ByjfR/tGklGwJg30InC+eiztl5DSF5ubo9XeL/JvEuV9l/jx4yMdLrHJwJz
 aVXfCc3CVSXMa01l0gqt79p+O4ap/FgftZsBSGMgmv23Fv0jKgPbajy/bK/q6EqvAVAZ
 IQDfP2ndCVAI8DPRo24JLQNBP2DRZLOL8Z4JNstZTtrUKON7WcEpqE4Br7qdClxtTdJP
 QFPQ==
X-Gm-Message-State: AOAM532Vwo+pkvhC+j0EMlO/lSFetnJLXRedl4UC/f4+dhSlQXHmNdB5
 UIRgM1qi1eF7jH4Pve+unpl0xOw0HBQC0rEq0WZTqcs3bfM=
X-Google-Smtp-Source: ABdhPJy/FeQxzQszfiH33uOWaccj4JEo3pvq0ekiMOC1+TiGVdTADnFmscwMk0igU9qcjJHn9X3GpIIhMlgC28sEOaI=
X-Received: by 2002:a05:6e02:542:: with SMTP id
 i2mr1867971ils.203.1592444621188; 
 Wed, 17 Jun 2020 18:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
 <20200617141155.GQ9499@dhcp22.suse.cz>
 <CA+G9fYu+FB1PE0AMmE-9MrHpayE9kChwTyc3zfM6V83uQ0zcQA@mail.gmail.com>
 <20200617160624.GS9499@dhcp22.suse.cz>
 <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
 <20200617210935.GA578452@chrisdown.name>
In-Reply-To: <20200617210935.GA578452@chrisdown.name>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 18 Jun 2020 09:43:05 +0800
Message-ID: <CALOAHbBp7Ytd-Hta9NH-_HJtVTAsR5Pw2RYrVScp7PPezCEv2w@mail.gmail.com>
To: Chris Down <chris@chrisdown.name>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (laoar.shao[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chrisdown.name]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jljak-0072kG-Ob
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
 linux-mm <linux-mm@kvack.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Cgroups <cgroups@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, open list <linux-kernel@vger.kernel.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 18, 2020 at 5:09 AM Chris Down <chris@chrisdown.name> wrote:
>
> Naresh Kamboju writes:
> >After this patch applied the reported issue got fixed.
>
> Great! Thank you Naresh and Michal for helping to get to the bottom of this :-)
>
> I'll send out a new version tomorrow with the fixes applied and both of you
> credited in the changelog for the detection and fix.

As we have already found that the usage around memory.{emin, elow} has
many limitations, I think memory.{emin, elow} should be used for
memcg-tree internally only, that means they can only be used to
calculate the protection of a memcg in a specified memcg-tree but
should not be exposed to other MM parts.

-- 
Thanks
Yafang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
