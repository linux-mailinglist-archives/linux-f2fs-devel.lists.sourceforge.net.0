Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7B4E4AB6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 03:04:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWqMK-0008W2-A1; Wed, 23 Mar 2022 02:04:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nWqMI-0008Vs-Vn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 02:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sj6VvC5iMmzyukYbPBIOXyTPJrBZLqUvWOBfUQn8two=; b=Nelmh1kYPjPc/TyN/zi1+tXBI1
 r49v9AgR/fCm7Vk2ak6ruVjm6cqZyymWbpIBZGab08/Z+njfoVEvX6bfloMpa7vTwRY7NLExxa9JN
 HIE2x2b+m0YKi1t/8UbUIDevY35zWihjEncolqd3mbTZb/E8XrOYPOd/m9+MG0n20xUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sj6VvC5iMmzyukYbPBIOXyTPJrBZLqUvWOBfUQn8two=; b=mloa/rVesrPT92ook7HAhpzKZ0
 ysaO5ye/ed3vxWRPGJvX4Xmyy6j8mWQngiL96QFRkl1o8at6XJj9nARufmdvWEz8tP68N0kLrHEwT
 dSBc0iPcT/H4dXhp77UUOOWuRxZyFxkkMzIJF1EEhW2zMh4oax3wvMgNwon1+8uTOpDg=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nWqMC-0006P0-UN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 02:04:21 +0000
Received: by mail-lf1-f50.google.com with SMTP id bt26so396483lfb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 19:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sj6VvC5iMmzyukYbPBIOXyTPJrBZLqUvWOBfUQn8two=;
 b=UOXiI1q346c6OcIvufJQ0+4pmDjiHq9Jpv4CjRI3buFoKmrtF5s5hrtsI9plQZhtca
 utP01u0qD7ibZpwsgmM1HnxjnR+hmocZRN32SaDsELqJqqLM2VfhmEjqmUNxVra8NkwO
 F3bE988q7tf976xM1smV6Ehz0ahG9oBY/x2RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sj6VvC5iMmzyukYbPBIOXyTPJrBZLqUvWOBfUQn8two=;
 b=matCh1E/KFzcTvdBo6kc7j7pMvOtlAsT2oymCABIcfYO9ySo9RfyI6cs5UU0Wi2kYy
 BEXQy/rL2u36GSJUcMtBu4dhsnVcvZtS/S1LHrb0Y27x0n3CACkl2Dv97yP8UuBv+qaU
 u3u1JUSUdkalWkQHn1lHo4HqoZSgBZrbt2gemtS7G4UcDbIphzvrjTgM1rbt3J6u6+QE
 Abta5sPgdL/4Ux9P7ZCSVRadoDPaZ7086H/wzwwTMcKme7VfgoNy2IgZhBoqWly0MWaR
 7ScpffjdP//+K+6lqrEebZjtg3ZwajvmdKzM/1soTjjlIpQq0t8xUKePRmBh15oUtH6s
 esPg==
X-Gm-Message-State: AOAM532FfWzwTjTS0id+uUUpsmq2e5NViVC/3FvyFV2JOKF/FBe35Ih2
 gRRzUosST/OrwXbR+tsNUSjfmTscvjudxko9YfE=
X-Google-Smtp-Source: ABdhPJxsBpYBOxnoplNmxrBp8iR5DL1X+G1Tn6EHyBBvHVFUehgWcBD27G515RE+zBPW6YAd8I94BA==
X-Received: by 2002:ac2:434c:0:b0:445:bfb1:c37a with SMTP id
 o12-20020ac2434c000000b00445bfb1c37amr19687754lfl.657.1648001049822; 
 Tue, 22 Mar 2022 19:04:09 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 bu20-20020a056512169400b0043eaf37af75sm2359698lfb.199.2022.03.22.19.04.08
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 19:04:08 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id b5so35700ljf.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 19:04:08 -0700 (PDT)
X-Received: by 2002:a2e:9794:0:b0:249:8488:7dbd with SMTP id
 y20-20020a2e9794000000b0024984887dbdmr9582628lji.176.1648001048529; Tue, 22
 Mar 2022 19:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
 <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
 <CAEe=Sxmcn5+YUXBQhxDpzZVJu_T6S6+EURDqrP9uUS-PHGyuSg@mail.gmail.com>
In-Reply-To: <CAEe=Sxmcn5+YUXBQhxDpzZVJu_T6S6+EURDqrP9uUS-PHGyuSg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Mar 2022 19:03:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGKUyJpi0dTQJjyJxdmG+WCeKkJJyycpOaUW0De17h_Q@mail.gmail.com>
Message-ID: <CAHk-=whGKUyJpi0dTQJjyJxdmG+WCeKkJJyycpOaUW0De17h_Q@mail.gmail.com>
To: Tim Murray <timmurray@google.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 22,
 2022 at 5:34 PM Tim Murray <timmurray@google.com>
 wrote: > > AFAICT, what's happening is that rwsem_down_read_slowpath > modifies
 sem->count to indicate that there's a pending reader w [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nWqMC-0006P0-UN
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.18
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
Cc: Waiman Long <longman@redhat.com>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 22, 2022 at 5:34 PM Tim Murray <timmurray@google.com> wrote:
>
> AFAICT, what's happening is that rwsem_down_read_slowpath
> modifies sem->count to indicate that there's a pending reader while
> f2fs_ckpt holds the write lock, and when f2fs_ckpt releases the write
> lock, it wakes pending readers and hands the lock over to readers.
> This means that any subsequent attempt to grab the write lock from
> f2fs_ckpt will stall until the newly-awakened reader releases the read
> lock, which depends on the readers' arbitrarily long scheduling
> delays.

Ugh.

So I'm looking at some of this, and you have things like this:

        f2fs_down_read(&F2FS_I(inode)->i_sem);
        cp_reason = need_do_checkpoint(inode);
        f2fs_up_read(&F2FS_I(inode)->i_sem);

which really doesn't seem to want a sleeping lock at all.

In fact, it's not clear that it has any business serializing with IO
at all. It seems to just check very basic inode state. Very strange.
It's the kind of thing that the VFS layer tends to use te i_lock
*spinlock* for.

And perhaps equally oddly, then when you do f2fs_issue_checkpoint(),
_that_ code uses fancy lockless lists.

I'm probably mis-reading it.

             Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
