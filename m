Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 349191FF20B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 14:38:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jltnm-0002mC-Rs; Thu, 18 Jun 2020 12:37:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris@chrisdown.name>) id 1jltnm-0002m5-0q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OgZomFoj/7toYCBCKWRo7nq/kYdKAWeXt05LtEajY3k=; b=WJ509USN74qT6gw1TqGvZoIClc
 emO4+OCGprWj3h7CtDGmO/Dwu2hkYHgHJgS6CBabgAl4df7TN1SA2BLNaz2j+I8DSPkV8OePG0HNy
 NP8LPbhltgdJzCf5eaZZ4cIfedaVeQXdoX20y9kxRuWEcqL73XhRQXoI4MjcGZZpGM6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OgZomFoj/7toYCBCKWRo7nq/kYdKAWeXt05LtEajY3k=; b=UFSluMCwzUqlrus45qVTZtEE0N
 6kv5h6inBTAZQL0E1nn1nvIEe4ivseCW5WzY3JWnZiuqksByfpBwYz/XANYJLeFZ8SFqn/LDWYR6g
 OoRxtSgru+D843riNbO2TBG9uxfz+D8h24aPbtVtzZanl79v6cKwotUOuYwGrtCmV4lM=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jltnj-00Ad10-5H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:37:53 +0000
Received: by mail-wm1-f66.google.com with SMTP id d128so5485404wmc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OgZomFoj/7toYCBCKWRo7nq/kYdKAWeXt05LtEajY3k=;
 b=Vba3/YBp135F4zjZnb2RedWXF2lwu1lFFL34CLaNpxPjPTPlt0UR472eYi5S4YZ1Wx
 Z0rDK+6Hs9d3o0cUOdxwi2SS36Jq5bWlnav7DNmZNgJpcMQ+D8caGFIGg/ORh0SmmPxl
 k69/g/gWD8TgMCYkGiY2Wz/GRty0LMQ/SrbXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OgZomFoj/7toYCBCKWRo7nq/kYdKAWeXt05LtEajY3k=;
 b=QTn92uOJCOCZtFlplmJKcMoC7xmNUWCMcQgtRrAmj7V26x9/PlVBley0hmB8L6tGx4
 XSaKSvnzXWxRakKn42jRgruZdqa+/WL4ZWOAWtG4RDVl/5jrW53XPkKMhvh/6fu8M4VA
 +fTMbCxrxExLev0oFDK1QLpwqE1wy9PcNN4jLt3eLB1RG7sNz4Y7aMaQWmcgFXZDMZzG
 1ZCtuoKWPsnPKLrT4l5XM4Ubq0lvMJ2UUEIjVRoQSny6ERq9MWfKwGIo3CnHccZdCoNq
 UEJq2V84d4b2O/b+KCyUkuJbb44kExkRoGbIrG3fkqWjLEYGA1Q0tdUDazN1JsmhZ55i
 yhHw==
X-Gm-Message-State: AOAM532bMgvDAmHsxHQBOas1pKzNso+peP89zFLYdU4X3pifDiOqGySF
 j9jy4PuLauwwsR8c5KnwhKfCSw==
X-Google-Smtp-Source: ABdhPJzFoWSkp2MqAS0xx92RSUWbWQ0U7Z92SQ/MTtOdoN5z3gnxoKRC/r81z8qHIYMjhulYtZARyw==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr3734793wma.157.1592483864725; 
 Thu, 18 Jun 2020 05:37:44 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:63de:dd93:20be:f460])
 by smtp.gmail.com with ESMTPSA id t82sm2586962wmg.10.2020.06.18.05.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 05:37:43 -0700 (PDT)
Date: Thu, 18 Jun 2020 13:37:43 +0100
From: Chris Down <chris@chrisdown.name>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20200618123743.GA694719@chrisdown.name>
References: <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
 <20200617141155.GQ9499@dhcp22.suse.cz>
 <CA+G9fYu+FB1PE0AMmE-9MrHpayE9kChwTyc3zfM6V83uQ0zcQA@mail.gmail.com>
 <20200617160624.GS9499@dhcp22.suse.cz>
 <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
 <20200617210935.GA578452@chrisdown.name>
 <CALOAHbBp7Ytd-Hta9NH-_HJtVTAsR5Pw2RYrVScp7PPezCEv2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALOAHbBp7Ytd-Hta9NH-_HJtVTAsR5Pw2RYrVScp7PPezCEv2w@mail.gmail.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chrisdown.name]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jltnj-00Ad10-5H
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
>On Thu, Jun 18, 2020 at 5:09 AM Chris Down <chris@chrisdown.name> wrote:
>>
>> Naresh Kamboju writes:
>> >After this patch applied the reported issue got fixed.
>>
>> Great! Thank you Naresh and Michal for helping to get to the bottom of this :-)
>>
>> I'll send out a new version tomorrow with the fixes applied and both of you
>> credited in the changelog for the detection and fix.
>
>As we have already found that the usage around memory.{emin, elow} has
>many limitations, I think memory.{emin, elow} should be used for
>memcg-tree internally only, that means they can only be used to
>calculate the protection of a memcg in a specified memcg-tree but
>should not be exposed to other MM parts.

I agree that the current semantics are mentally taxing and we should generally 
avoid exposing the implementation details outside of memcg where possible. Do 
you have a suggested rework? :-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
