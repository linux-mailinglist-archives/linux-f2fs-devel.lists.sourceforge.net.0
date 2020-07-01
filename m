Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119F21103E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 18:08:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqfHX-0003ma-1U; Wed, 01 Jul 2020 16:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqfHU-0003mR-PA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8hXw4xpceiwUmAoUF//Pc4W1OnjxK11vea/5FDqjvc=; b=P0RlfFmU8sPhzg4fK5lUrXD0zu
 6EcJeNITstfOTgucbaebIYn08rXlSuQ8nnAXJCvsecLUma1RznrDMvQ42yncRU0wKQYgswi1b0xmQ
 N8YbKSkLfPlaharODl0jx955ihPL+VaxXgcBkICRDcQ5JXkPOUOcEZcZ5+TmZzHQ0MaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8hXw4xpceiwUmAoUF//Pc4W1OnjxK11vea/5FDqjvc=; b=eFwgpUhjHFHCwea6Wz5DVt1AS1
 EQr+Ezu3URjuvFWOpV6wBSNSHrSj5FFEvK6fcYMYlfFPg9Osp27eHSKEgD9zuUvdRqzJASkc0Rviz
 w/A+Q1o03ZVWDrFUgOs59SZ1XihPeMBnzOe3WkNjfL156YUFadJLSAgDpT9f+x7lfy4k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqfHT-0079Q8-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:08:16 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F64E207BB;
 Wed,  1 Jul 2020 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593619689;
 bh=rKlFbyXow7krvfPu19nW4SgQi5tpEc/I/oNA9viF45g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRKJBDc8JRl65S0w4WRf8lyH1aW2b2orXnXo13pT7/weuTEVdSHJdxNz7/MDlJFpH
 /17FJwp8e9z2RiTAHYj/QbR4k3McRBUP/L32p6MQaYzw1n8vkQryv99mDhiR244edy
 Pp0Ot3MoLSnZEnyFazgqyUNlrps4mdeltbxhEjFE=
Date: Wed, 1 Jul 2020 09:08:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Gao Xiang <hsiangkao@redhat.com>
Message-ID: <20200701160808.GA1704717@google.com>
References: <CAB3eZfsO0ZN_79oaFpooJ32WNZwwyaS4GBb+W6jR=buU-VczAA@mail.gmail.com>
 <20200701091622.GA5411@xiangao.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701091622.GA5411@xiangao.remote.csb>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqfHT-0079Q8-Mo
Subject: Re: [f2fs-dev] Fwd: Any tools of f2fs to inspect infos?
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/01, Gao Xiang wrote:
> (cc linux-f2fs-devel, Jaegeuk, Chao.
>  It'd be better to ask related people and cc the corresponding list.)
> 
> On Wed, Jul 01, 2020 at 03:29:41PM +0800, lampahome wrote:
> > As title
> > 
> > Any tools of f2fs to inspect like allocated segments, hot/warm/cold
> > ratio, or gc is running?

# cat /sys/kernel/debug/f2fs/status ?

> > 
> > thx


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
