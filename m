Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF03BF7D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jul 2021 11:52:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1Qi1-0007fA-EU; Thu, 08 Jul 2021 09:52:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m1Qi0-0007f0-0H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 09:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PhlJNBpetjZSDV5/yCI47Cdt6ca/0zPJcaE8KUURNEc=; b=IkpnuOqX9joK3BQGSE6ahyotST
 OVobIkMuRO/NL48f2C4tYXit98o1jysEJ+1ptHCD3Ht/l/Es7MNZ1niUo/2Ep6fwiRFGinaTKTS8Q
 aODFBDlCVRO04/68kmLBQ+/M1m/luxB52i57hDsszJ72C5CvgQdgsFxKhDWBa47MMDIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PhlJNBpetjZSDV5/yCI47Cdt6ca/0zPJcaE8KUURNEc=; b=cZP9MylWE8s8ULTYc/C7lH0nC1
 bR66BA4NPTpDBFPhpJky5R8A2aladC3+15pzVZFHYPwIdx7s0DAs7UHoCLo8HorE12yYVAan+azzi
 viysD+zwVkH1CxbOtpOHeBuFCwSl9EuwpOWfKsev7+XLg2d4v04EshHa9yqj5AZ/cx3Q=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1Qhk-0003nr-7S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 09:52:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EA857201A1;
 Thu,  8 Jul 2021 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625737937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhlJNBpetjZSDV5/yCI47Cdt6ca/0zPJcaE8KUURNEc=;
 b=f5l6TTOQAYB3MaKb1DZ9Ruzgb2xHoK54uI9sHiBGLRmiaQokt0TJV4zeh2rFYpiEfoPau5
 XeZ3Swqiy7Kn2+OChoCLUlIaO59Ad2dxOlkgrUmLH4X1YXZjIPwHDS6x8felX1bGIGQ1D+
 EJhdDiBG3+7H1nbAG25qMUAma5eROjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625737937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhlJNBpetjZSDV5/yCI47Cdt6ca/0zPJcaE8KUURNEc=;
 b=J6vHDs5u3ru0i/nrlj6xKeplfW0Cbu6Uj5FAG7tRm2oWd5W0XLN9eUwnpV4eHv97lQYbCZ
 R4hE2UUNrTcoS2AA==
Received: from quack2.suse.cz (unknown [10.163.43.118])
 by relay2.suse.de (Postfix) with ESMTP id D6302A3B88;
 Thu,  8 Jul 2021 09:52:17 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 589961F2CAF; Thu,  8 Jul 2021 11:52:17 +0200 (CEST)
Date: Thu, 8 Jul 2021 11:52:17 +0200
From: Jan Kara <jack@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <20210708095217.GA32434@quack2.suse.cz>
References: <YOYHejl3CgABOnhP@google.com>
 <20210708094647.7c0d3060@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708094647.7c0d3060@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m1Qhk-0003nr-7S
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.14-rc1
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 08-07-21 09:46:47, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> On Wed, 7 Jul 2021 12:58:50 -0700 Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > Could you please consider this pull request?
> > 
> > Thanks,
> > 
> > The following changes since commit bd3c9cdb21a2674dd0db70199df884828e37abd4:
> > 
> >   Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux (2021-05-14 10:52:47 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.14-rc1
> > 
> > for you to fetch changes up to 28607bf3aa6f9762b32dc7f1ed0488823c0651b8:
> > 
> >   f2fs: drop dirty node pages when cp is in error status (2021-07-06 22:05:06 -0700)
> 
> Its worth mentioning the semantic conflict against the ext3 tree (which
> hasn't been merged by Linus yet, but presumably will be).

Whether that particular series causing the conflict will be merged by Linus
in this merge window is uncertain - Linus didn't like how filemap_fault()
unconditionally acquired the lock. I've created an optimization patch to avoid
that but review is pending... At this point I'm leaning towards the variant
that series won't go in during the merge window. In that case I'll
probably rebase on top of rc1 and force-push everything.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
