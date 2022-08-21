Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CFC59B2E0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Aug 2022 10:53:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPgiM-00081L-1P;
	Sun, 21 Aug 2022 08:53:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+a2efb402714a86af2474+6937+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1oPgiK-00081B-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Aug 2022 08:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZG4Es9fzRMT5wrH3Tq+h9KlclsxiCzHKQ6STwuA6oEY=; b=DvYGYYdIGxbd8OuixTfg2L1co3
 PkqHJeUFc1x4lzcNq0x2+0fRWsb/TYocxOhAHVkXOsON251NA7nBGxbyyzSqcgElVPADFbUev2z4/
 3oMmTcmz4N+8T72pd/n1JUN2tQwxOthoph4N82eRapiw5YJYZ2gNO7KtnbWzgnrVJ4HQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZG4Es9fzRMT5wrH3Tq+h9KlclsxiCzHKQ6STwuA6oEY=; b=P2ZFvlWLOTnrevaaYQLZi2SpTn
 MMi4RN08UimJjMSsml7925OSyrzw5zDev/e7XwZIda8pe+p/38+iiB4EXzOBTZWjubpbTqC2i5cpq
 DnrYBjH9kBhldYiSxUi+eqKkh4B/1TCwP4e0GL+1nEtbdRl72FEXadit0VVeJ41es3lg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPgiI-00Bhu8-54 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Aug 2022 08:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZG4Es9fzRMT5wrH3Tq+h9KlclsxiCzHKQ6STwuA6oEY=; b=NPTUpR2TGbEGKev6MERMWxooFG
 ZiJJjPsPAHnqBUcO2CFAj6Vu6hAc3j5M6DeVz3k2hJd7xxalHutHctTFyvYAhRSiMuYQzdMYaAa9k
 WBNgoPSU6TF4upc7I+yWqXWo+afkfRMrrsiTEmeBXwGm9kKSvw1mY2HuqMGQj1ybZWFBcviB7t/Jx
 CNZtj16845VF1Evf0T8Auz57FsdmXm7IQcRaeQn96X3j+ZSDhD8Nyc4APtWOwsUqG0QARrCSLeVgb
 xIMkJ0036ubpmdQL4mSj6MNnxsleHp2IQ98hONYLivxszc2hcm0EoaksqSX32ZF8ehDAQbYS5mLFa
 jLqkzAsg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oPgi5-008Q9X-HL; Sun, 21 Aug 2022 08:53:33 +0000
Date: Sun, 21 Aug 2022 01:53:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YwHyjVwCGBqzzbd/@infradead.org>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-7-ebiggers@kernel.org>
 <YtyoF89iOg8gs7hj@google.com> <Yt7dCcG0ns85QqJe@sol.localdomain>
 <YuXyKh8Zvr56rR4R@google.com> <YvrrEcw4E+rpDLwM@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvrrEcw4E+rpDLwM@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 15, 2022 at 05:55:45PM -0700, Eric Biggers wrote:
 > So if the zoned device feature becomes widely adopted, then STATX_DIOALIGN
 will > be useless on all Android devices? That sounds undesir [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oPgiI-00Bhu8-54
Subject: Re: [f2fs-dev] [PATCH v4 6/9] f2fs: don't allow DIO reads but not
 DIO writes
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 15, 2022 at 05:55:45PM -0700, Eric Biggers wrote:
> So if the zoned device feature becomes widely adopted, then STATX_DIOALIGN will
> be useless on all Android devices?  That sounds undesirable.  Are you sure that

We just need to fix f2fs to support direct I/O on zone devices.  There
is not good reason not to support it, in fact the way how zoned devices
requires appends with the Zone Append semantics makes direct I/O way
safer than how f2fs does direct I/O currently on non-zoned devices.

Until then just supporting direct I/O reads on zoned devices for f2fs
seems like a really bad choice given that it will lead to nasty cache
incoherency.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
