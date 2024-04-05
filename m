Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70B899D38
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Apr 2024 14:41:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsiss-0006SL-5l;
	Fri, 05 Apr 2024 12:41:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rsisq-0006SC-9d
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 12:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pM8ku/k+HG+DRvbgpdHgmsq0Y2sQAqCM3oLo4AlR/Jo=; b=XsBRARVQp4M649AUNRQJIUpM8D
 5Wso3aT3vYjmWhXbPv9lQKkvnN4EDp/vHLaRocpTctBsZySMTDBoWnvPOVBUimKikNX1EmABShQSs
 pM4zDDn0T26ElYXgCLcl/g/OscR+ZmkApYxVejfOzRww7TdpV3UQPZGQeYQm5tdxsdaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pM8ku/k+HG+DRvbgpdHgmsq0Y2sQAqCM3oLo4AlR/Jo=; b=RHmcW7DhQQljxXKjaZbDn/TCDo
 ElUVNdkvv/Q2pydP7veFSIdLrj8ce3fuHFMj+6L33PLR7gn6D1bKjqjdY7pvcJgKAxDrpfnM3XVnz
 Qo3QUlxLgThfADF0cXBWY3s7kCy9m4EtuV1OpeDNV7jDBX18UsKvAbmDy3G6ful6WI74=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsisl-0006MU-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 12:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pM8ku/k+HG+DRvbgpdHgmsq0Y2sQAqCM3oLo4AlR/Jo=; b=ruJA5GKT8MQAZXQt4R8YzVLx3q
 BponjEjS37cz7oDZzozhnIrP+VyqxjOnY6s6TgcBd23ZzhO+rfoaoarVGyNi99n1r/jgFCNausf3U
 ClItxZiQk1Aw+8AhE4DrCHliNC6oK3PSaCrXVXK1/C0Ps8STreiUWiRLjfEqG3J09/p569I/Sn0p4
 N5VEswxDPIi6MPPQUZelxVFM/iDjUbwQaz0uswbahPJ0aJW6LKgYtvjwWfCZtRbgNXYBDuam2ZWhV
 tsRDnu1PTH6l77o0/U1m10ld/koAobb/u5T6EH0DP93CJiskgX95YEjcUP2W3cv7j/42GzjyNk1Wj
 OMNzZFTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rsiWd-0000000ARWt-0dWU;
 Fri, 05 Apr 2024 12:18:31 +0000
Date: Fri, 5 Apr 2024 13:18:31 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <Zg_sF1uPG4gdnJxI@casper.infradead.org>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405121332.689228-1-eugen.hristev@collabora.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 05, 2024 at 03:13:23PM +0300,
 Eugen Hristev wrote: > Hello,
 > > I am trying to respin the series here : >
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 The subject here is "Cache insensitive cleanup for ext4/f2fs". Cache
 insensitive means something entirely different
 https://en.wikipedia.org/wiki/Cache-oblivious_algorithm
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rsisl-0006MU-S5
Subject: Re: [f2fs-dev] [PATCH v16 0/9] Cache insensitive cleanup for
 ext4/f2fs
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 05, 2024 at 03:13:23PM +0300, Eugen Hristev wrote:
> Hello,
> 
> I am trying to respin the series here :
> https://www.spinics.net/lists/linux-ext4/msg85081.html

The subject here is "Cache insensitive cleanup for ext4/f2fs".
Cache insensitive means something entirely different
https://en.wikipedia.org/wiki/Cache-oblivious_algorithm

I suspect you mean "Case insensitive".


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
