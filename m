Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF31C46940
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 13:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbCVvzZUO41wx5FBU/BmoFoS8k/7qzZdgavO61YakBk=; b=A+Jee2UmRwMJYw0y5Yl0aWGLDC
	hUBXD+KmQu+kXABzSQC90V2uFQtQdBOODTxTfmUtMX1QpU3cI+bpkLqgGkxAR6Qw/ZK9UJitv8K3k
	0ujL/wlFJ1U3XQcrTFbjK2UkF8YT1sr/9SDREbB91eUI0CfpaIC8WcAbcSssNu5ii4VI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIQxc-0004FB-7j;
	Mon, 10 Nov 2025 12:25:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vIQxa-0004F3-VM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 12:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AdI7IxF7cmaOwwPz2uPN9pz51vkfzTah0Iexytj/exg=; b=mB6Nk3I1Xqk9Evx0/AhQqHa8hC
 mrXKFunFcUI70PEIIHSZkA23AlSXQH6NyvBTT/LO+dzhOxJCS73oKQpMtmDXD8N7X6ZYZOv700Pog
 ZaDXMpEsH7JoSyx++bvbs8febSYTBZc6bWGCAOFPexRgnYSu2zRlF0AF7yYgCuWaRxzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AdI7IxF7cmaOwwPz2uPN9pz51vkfzTah0Iexytj/exg=; b=NiqGgmSuNRKl9LxRGP0x9UvY5m
 JmJ64J5Hx7OQqiugAtZc0OLUErQHzrZm07JFyv9w10LGWARn58sBPdYjZHud6U5/jQY1o4tjyFUT4
 zDZWhYERuUefhqmdrQw2wSj+x4Q6dyz74E+HmumRz71U869JveEWnoMsm71uBGPMOvzI=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIQxb-0006lF-95 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 12:25:27 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-640bd9039fbso5970519a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 04:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762777521; x=1763382321; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AdI7IxF7cmaOwwPz2uPN9pz51vkfzTah0Iexytj/exg=;
 b=WCt+cTe0EbzYVueVDgsdLgop+fFU57aFx/kGGntROe/303Bqail97PTsrX+Kv0IrFm
 7DnJsF0OeVmIpLCWZQuzc+ypZEWa7pncQg2dDntya4VBBcLQzlKhE4b3dEMRwhn4j1ch
 JIcrzvqb2k1JNmEemFeBTuiZufmmn16/khBdhIhcdWHW4ct1kkrgGD/kkNxcrkLE+gCM
 DTn2/Rt6Cr6rxpExl+spIRxC2+chAU08enwfKQL2ZMWSQJBkn5B+WbthTmL7aAYHVgZf
 W3sE4KjHObAFYO02hFKOasQgApUUpv5qxDer5kCP9V6oPv58/p/jRKp1fT/QG0rtntog
 o0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762777521; x=1763382321;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AdI7IxF7cmaOwwPz2uPN9pz51vkfzTah0Iexytj/exg=;
 b=YbzYoY9kCQ5bYjHWt10D2nfz/aw53TMa9Oxn93ifY13S3fNn7hxtZaR5QGkQp4J4ed
 rjZT7PBEVIVC8bHbQ0lJB5s9N1TyxWmc0cqlE6fvbMjo/J1D/3UNZmYYQFvJs1ZEeLiQ
 zxEbQLv18Y3UohkT2cB6O7UEYvBcZETB+YEQ+V5LucZugxX0PEDb11x/1xDLketKmRmR
 pzljwjMj1mBG0ZNW0CBjfzdPKMOo2sFJjAE0d2IBAEfDIVscce6GxNwaPWNUBRTtYoYe
 dV6CO4IJV48aicJiOedK9L3Nk38vYzIMuTTwmKDOYEkk5AljABTGMTk8yjKaOlwzdbjM
 1L1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr81JExhXg63VbSSRfYApP01dUcWZnlEcXJoJpXsFc2tvtt8SlE1cpJbxkNWSyJHrjWYPhZPriXV/shbl/JsdI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx6SCbxZOy+XWIbyKhPRdXjloa86c3YP5VABQs8O9gT4zzBTAlg
 UvdmiGKEpuYQbaxCjE8Q56mFFyIF7j+quDwtAxGrvTCJqp9aHb9Vt8hZDovlFOO581Q=
X-Gm-Gg: ASbGncv46I5abhnG2kLX0YgewckKnLoe9p0dghXJtg0bfh+MHQIJI52NiECxkq8KA+V
 vcBmt5WHRZzuYrY/wA9Il/kCSzlQs+m6uGTUp71F1uYYy4UWKYL0z4EZJ3VVyZr/fqGcG8/v8Ih
 vD3YHcBKw2KHrBUDjKsq1E9e2zOiIM9VnPs0D8q64bji069KGlAONSgLoW3lngHWEjRLbe/impF
 FwpVDItMfHJYaZDqY+hUvclYanF/s4fR4SazqLTSFNLAnO6L9pE9vnb34Nl1qkmeMXMGhK870UR
 z5mukdJQ5+XPOkR5qDANiNktPjwBHxK0y9aKUuiHh7TAQyCkArlg3n+hOf3GQ0ui1pcapHavYGy
 Ov4ahvJpMafMbbgY96XmS/FmWRbTWsxVjdVKqwcP7zkZOfxi2tl9xWT+YN024gq8AlOHV6N9FDx
 37nGs=
X-Google-Smtp-Source: AGHT+IH45M4martpu1ZV9EapqxF5z1Rmn3ab4L1EkLdaCAIViHu2tcBKPEF2r4oHemmDEAtCuQt94g==
X-Received: by 2002:a05:6402:27cf:b0:640:825e:ae82 with SMTP id
 4fb4d7f45d1cf-6415e80a83bmr5792863a12.29.1762777520696; 
 Mon, 10 Nov 2025 04:25:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f813bedsm11054476a12.10.2025.11.10.04.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 04:25:20 -0800 (PST)
Date: Mon, 10 Nov 2025 13:25:18 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aRHZrgMXUeMMY_gf@pathway.suse.cz>
References: <20251107194720.1231457-1-pmladek@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107194720.1231457-1-pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-07 20:47:18,
 Petr Mladek wrote: > This is outcome
 of the long discussion about the regression caused > by 67e1b0052f6bb82
 ("printk_ringbuffer:
 don't needlessly wrap data blocks around") [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
X-Headers-End: 1vIQxb-0006lF-95
Subject: Re: [f2fs-dev] [PATCH 0/2] printk_ringbuffer: Fix regression in
 get_data() and clean up data size checks
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
From: Petr Mladek via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 Joanne Koong <joannelkoong@gmail.com>,
 "amurray @ thegoodpenguin . co . uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 2025-11-07 20:47:18, Petr Mladek wrote:
> This is outcome of the long discussion about the regression caused
> by 67e1b0052f6bb82 ("printk_ringbuffer: don't needlessly wrap data blocks around"),
> see https://lore.kernel.org/all/69096836.a70a0220.88fb8.0006.GAE@google.com/
> 
> The 1st patch fixes the regression as agreed, see
> https://lore.kernel.org/all/87ecqb3qd0.fsf@jogness.linutronix.de/
> 
> The 2nd patch adds a helper function to unify the checks whether
> a more space is needed. I did my best to address all the concerns
> about various proposed variants.
> 
> Note that I called the new helper function "need_more_space()" in the end.
> It avoids all the problems with "before" vs. "lt" vs "le",
> and "_safe" vs. "_sane" vs. "_bounded".
> 
> IMHO, the name "need_more_space()" fits very well in all three
> locations, surprisingly even in data_realloc(). But it is possible
> that you disagree. Let me know if you hate it ;-)
> 
> 
> The patchset applies on top of printk/linux.git, branch for-6.19.
> It should apply on top of linux-next as well.
> 
> Petr Mladek (2):
>   printk_ringbuffer: Fix check of valid data size when blk_lpos
>     overflows
>   printk_ringbuffer: Create a helper function to decide whether a more
>     space is needed
> 
>  kernel/printk/printk_ringbuffer.c | 40 +++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 7 deletions(-)

JFYI, the patchset has been comitted into printk/linux.git,
branch for-6.19.

Note that I have updated the Subject and a comment in the 2nd patch
as suggested by John, see
https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?h=for-6.19&id=394aa576c0b783ae728d87ed98fe4f1831dfd720

Best Regards,
Petr


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
