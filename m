Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B251E728E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2020 04:25:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeUi2-0002iv-P4; Fri, 29 May 2020 02:25:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris@chrisdown.name>) id 1jeUi1-0002ik-KG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 02:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GN9DgkPdwejhyEVH1kmP5gS0KBOAcxSeuTuQOx2XI9o=; b=SiRsE/rqsN+QdXZIcBZKDZJpzK
 PdICJbhsm82eWIhxfRM/0a5hOJ4CJUWfYkanB80UNPGqVFWKDph7vR/IARmbGZSoRxsL4mxZULB/K
 HzS6Ux50gNBO2qUHdVZZnz4SKTM5ECHhH3JIaEcoClk/HQOdLGkzovvrD/M33qopuxdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GN9DgkPdwejhyEVH1kmP5gS0KBOAcxSeuTuQOx2XI9o=; b=WQkhJ36GmaR3i+DOcia8HhuhU/
 b6zUkikgpDYuF2xVn89j8Xwyv7i2UcweRTcQym2AbCM/s1+eGj4IgilQsYPTiKbYfQ2K08E/z5EkQ
 BD8IBqo2jsdc6bUCAmWX3uA8BdpY2LjTTiirF1aYT2fvi27lbrjIMZl+eH4RnKfeGktQ=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeUhq-002Bui-7l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 02:25:21 +0000
Received: by mail-wm1-f68.google.com with SMTP id l26so1452977wme.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2020 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GN9DgkPdwejhyEVH1kmP5gS0KBOAcxSeuTuQOx2XI9o=;
 b=lkBaXTV2ZUB6ZO5yX3Ng0K/CASCbc9oNlaDIc8KLZ8e4v2cb+z5+AxOSC0HUqdLw42
 pPHQXKJiXMf7fSmverIul8xSND7c0ygaABLVaG0hqIXTL8OJ4e0fS8l8+kZ0LHaXgNsT
 f3Y+1qQWXh34SIawtNNfPuqOwbkRTPMzu6he4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GN9DgkPdwejhyEVH1kmP5gS0KBOAcxSeuTuQOx2XI9o=;
 b=e0neKX9vL+UDPsAIivtKAkjEraYMZFNE1AEUcKSwX82hI+kB0C7jOGICaiEyMUt2jv
 5cypOj3w6BZYSeltlX+rtqgmh5jjypLXrRtqvoqU1IPWheIz5TjAhslZTWLBif/0ds41
 9x/F9vVt11GV2s75isqI1fzaWWmdGLoMlL+Zd3s4sLUuTuT00SHBf5Q0H80MrMyS589I
 r31PLyIjjBkmtynuPid1v2+lFpiaZSymNctyLQ5fJN/AG/Cp+5KxVuMXmzVoYUjAVOLK
 0QDQXHxqcl0gRRHsrgNrMJmuCFu6Hk9SpTd3ay3xYR99z+4XPIPc4cSBxXMdyt5kohTU
 nptQ==
X-Gm-Message-State: AOAM530XfU+fph2ToWIy3t8M0KVLgGJktsBqgIky5G0WyREzY3LGZ2zb
 MPd1Zo684LdmkiLga4Kld4L1/aG5wJiqMz1v
X-Google-Smtp-Source: ABdhPJx1kaceNrBzDvGLjsUvi/4uBliHtVGdHPjh2oD497Ebo468RL7eFjpFK3j2MrZfogR+PRA4Bg==
X-Received: by 2002:a7b:c096:: with SMTP id r22mr6033969wmh.92.1590717405871; 
 Thu, 28 May 2020 18:56:45 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:56e1:adff:fe3f:49ed])
 by smtp.gmail.com with ESMTPSA id q11sm1858042wrv.67.2020.05.28.18.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 18:56:45 -0700 (PDT)
Date: Fri, 29 May 2020 02:56:44 +0100
From: Chris Down <chris@chrisdown.name>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20200529015644.GA84588@chrisdown.name>
References: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
 <20200528150310.GG27484@dhcp22.suse.cz>
 <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
 <20200528164121.GA839178@chrisdown.name>
 <CALOAHbAHGOsAUUM7qn=9L1u8kAf6Gztqt=SyHSmZ9XuYZWcKmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALOAHbAHGOsAUUM7qn=9L1u8kAf6Gztqt=SyHSmZ9XuYZWcKmg@mail.gmail.com>
User-Agent: Mutt/1.14.2 (2020-05-25)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jeUhq-002Bui-7l
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Yafang Shao writes:
>Look at this patch[1] carefully you will find that it introduces the
>same issue that I tried to fix in another patch [2]. Even more sad is
>these two patches are in the same patchset. Although this issue isn't
>related with the issue found by Naresh, we have to ask ourselves why
>we always make the same mistake ?
>One possible answer is that we always forget the lifecyle of
>memory.emin before we read it. memory.emin doesn't have the same
>lifecycle with the memcg, while it really has the same lifecyle with
>the reclaimer. IOW, once a reclaimer begins the protetion value should
>be set to 0, and after we traversal the memcg tree we calculate a
>protection value for this reclaimer, finnaly it disapears after the
>reclaimer stops. That is why I highly suggest to add an new protection
>member in scan_control before.

I agree with you that the e{min,low} lifecycle is confusing for everyone -- the 
only thing I've not seen confirmation of is any confirmed correlation with the 
i386 oom killer issue. If you've validated that, I'd like to see the data :-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
