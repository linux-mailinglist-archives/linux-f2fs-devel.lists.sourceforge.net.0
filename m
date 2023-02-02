Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6B68890A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 22:30:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNhAT-0004xu-Ln;
	Thu, 02 Feb 2023 21:30:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1pNhAR-0004xn-T2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 21:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nrz3TSmcgrSpTyZCmW79h4FBugW4tEaSs53yJ16o+LY=; b=kiEduQ1j79x7Pm6nUHuyOkIiiN
 pn+h4JCjg9SLf5RTeENJbrZEnvGUmlI2scORiYls/JB2E7qIfxxZjNe6w2Ojel6/81FvhFWtyLDH4
 k7ayHVBq+zbKLoZ7y0PKvObu7mnejvcL2rUtFajnRfoicZHMFmYfBnBORQVXaCffRMK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nrz3TSmcgrSpTyZCmW79h4FBugW4tEaSs53yJ16o+LY=; b=EP4v8bB61TwE92VIPsOCUSc28I
 d0dawpv/qeuhVsqp8qTQrbbly61uiivuLgEHWAhHTYkhjncEk7dog+3tfSP1LVBUxn5HESR7AYLcd
 QP5wz3G57qZJ9A034R+tSocUPWmYAkuf1iCA5Toc1rUJ9asQWcRYywHbZm3luBs0J8N4=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pNhAQ-009L3b-Fs for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 21:30:51 +0000
Received: by mail-pl1-f173.google.com with SMTP id k13so3305549plg.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Feb 2023 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=Nrz3TSmcgrSpTyZCmW79h4FBugW4tEaSs53yJ16o+LY=;
 b=EEWpC85Vt6Nu9fYfzP562UwxgqEfKGDl+Svi44sV6+yCnSHoJaS5NtrLqfIY5P3Mta
 xzu7914vju2do7ooaEpdLyCJFOPe1YtRoXLOhvrSWoTw/XqN+Pakt0t7I1nsWreEZgif
 5L0/iFVQnExE645NHL6Nz6upvotE/mY94j1kjr/To9E80Yzxuac8JGv6w05Iy0Ozx1ev
 iNwrsUJ12hpCriwk28MItcJtsvVib34zGVBLKQT6dQl3MXbsHw19dJrjarP+3DErMzVN
 sTvfSBLMm1JhY4jnyRwr/iiGBO9Kn0TJMrDkTUrkeEhH5Q+LkJ3Oy/Xl7fsQhIpbbylX
 /0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nrz3TSmcgrSpTyZCmW79h4FBugW4tEaSs53yJ16o+LY=;
 b=a6zWcp/8IsZ+Vg8sc17X/IIKBynX78wziLy4Xkfa8FkifTepKFMXRFKCOnXugy1yHL
 UZGUE3GTuV4evPW+WItKAllWV7/e/HmB5WVDfNJOux60JNBpHyxWBiyl/XI+wEO0q/us
 1EZkDAlFifmX9cF5p4kw01JT73RwWcc9EqbqMJMW7u5lVnIQU6Tgl85bDkyCQ9oiY6Ol
 CKblQSm93WdPuAFxLJyUT4wYX5izWsVgC+f9j1+acJW2rwxUpPFnTWgFhOmKH+Z+JL1k
 FRw3BIy2aI/tMpUOetiIBSnxVJHIP1WYlGMFCSjgsn6ZuZ5nY8Hw7Ygx/CEtyaHAiJeV
 KDUg==
X-Gm-Message-State: AO0yUKXwa+6uP/ttZx/dqJABMo8vx8arEMgaGj3XuFBNR+0yPc/Uzqq6
 uTYYvBo2OOLFpCYj0MeAueE=
X-Google-Smtp-Source: AK7set8xILWDeKLdsoPmaeC+WBsqixXUKuHo6IuDnFV/HVdfnKuGG0DTdtoKhq33sbxB8mVxSURO+Q==
X-Received: by 2002:a17:903:30c9:b0:191:24d1:8af6 with SMTP id
 s9-20020a17090330c900b0019124d18af6mr6517030plc.42.1675373444647; 
 Thu, 02 Feb 2023 13:30:44 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::5:48a9])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a170902b59500b00186748fe6ccsm118158pls.214.2023.02.02.13.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 13:30:44 -0800 (PST)
Date: Thu, 2 Feb 2023 11:30:42 -1000
From: Tejun Heo <tj@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y9wrglzrfzTiCjh8@slm.duckdns.org>
References: <20230129121851.2248378-1-willy@infradead.org>
 <Y9a2m8uvmXmCVYvE@sol.localdomain>
 <Y9bkoasmAmtQ2nSV@casper.infradead.org>
 <Y9mH0PCcZoGPryXw@slm.duckdns.org>
 <Y9oHQ6MfRbfwmFyK@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9oHQ6MfRbfwmFyK@sol.localdomain>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On Tue, Jan 31, 2023 at 10:31:31PM -0800, Eric Biggers
 wrote: > > These can usually be handled by explicitly associating the bio's
 to the > > desired cgroups using one of bio_associate_blkg*() or > > [...]
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.173 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pNhAQ-009L3b-Fs
Subject: Re: [f2fs-dev] [PATCH] fscrypt: Copy the memcg information to the
 ciphertext page
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Tue, Jan 31, 2023 at 10:31:31PM -0800, Eric Biggers wrote:
> > These can usually be handled by explicitly associating the bio's to the
> > desired cgroups using one of bio_associate_blkg*() or
> > bio_clone_blkg_association().
> 
> Here that already happens in wbc_init_bio(), called from io_submit_init_bio() in
> fs/ext4/page-io.c.

Yeah, without bouncing, that's usually how writeback IOs are associated with
their cgroups.

> > It is possible to go through memcg ownership
> > too using set_active_memcg() so that the page is owned by the target cgroup;
> > however, the page ownership doesn't directly map to IO ownership as the
> > relationship depends on the type of the page (e.g. IO ownership for
> > pagecache writeback is determined per-inode, not per-page). If the in-flight
> > pages are limited, it probably is better to set bio association directly.
> 
> ext4 also calls wbc_account_cgroup_owner() for each pagecache page that's
> written out.  It seems this is for a different purpose -- it looks like the
> fs-writeback code is trying to figure out which cgroup "owns" the inode based on
> which cgroup "owns" most of the pagecache pages?

Yeah, there's a difference between how memory and IO track cgroup ownership.
Memory ownership is per-page but IO ownership is per-inode. This is because
splitting writeback IOs of the same inode can perform really badly, so we
try to find the majority dirty page owner cgroup of a given inode and
associate the whole inode to that cgroup.

So, something like md / dm, which gets a bio from filesystem and then
bounces it to another bio, would use either bio_clone_blkg_association() to
copy the association of the original bio (which probably is set through
wbc_init_bio()) or determine the cgroup the bio should belong to somehow and
set it explicitly with bio_associate_blkg(). However, here, as the
filesystem is the one bouncing I guess it can be simpler.

> The bug we're discussing here is that when ext4 writes out a pagecache page in
> an encrypted file, it first encrypts the data into a bounce page, then passes
> the bounce page (which don't have a memcg) to wbc_account_cgroup_owner().  Maybe
> the proper fix is to just pass the pagecache page to wbc_account_cgroup_owner()
> instead?  See below for ext4 (a separate patch would be needed for f2fs):

Yeah, this makes sense to me and is the right thing to do no matter what.
wbc_account_cgroup_owner() should be fed the origin page so that the IO can
be blamed on the owner of that page.

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
