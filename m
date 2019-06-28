Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B65A78B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jun 2019 01:25:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hh0F2-0007N1-U1; Fri, 28 Jun 2019 23:25:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1hh0F1-0007Ms-Gs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 23:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gh2oFWghIHrTNBD1izTrFr/szmDBJru7LcJZzZ60QQE=; b=E8i2owIo9IcPUpS9hx/Ri7FzLt
 wNWZkBzhpG7VzdrJvSUo/A+Broz7ihgT8ysnIAIv/ozdgkcHdfyvXD/jMsLSao6ODUbxxQbf7q+zK
 8pdTBPpWjBTYi0e1W6uiy2IhgUq2bzNgglvupMUCynfkT9WBVmqiThpjLBv+/rAGnocE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gh2oFWghIHrTNBD1izTrFr/szmDBJru7LcJZzZ60QQE=; b=cvSmPosgfV285iLeJYyYSTgQiz
 gwsgUG85aFygG9Rnn7+1ZivaJSCMgXOUTpzzCdKqLqA34lUN48o7V4q0+lzC/liqN4EJxU1oH+dWI
 Ivm2A9OK2KS7cZ39iYeZq1TKjzhff28J7zNMf76knpcO7Rrm81NaokrClkduiIZ/w3is=;
Received: from merlin.infradead.org ([205.233.59.134])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hh0F3-001D6s-L1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 23:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gh2oFWghIHrTNBD1izTrFr/szmDBJru7LcJZzZ60QQE=; b=AKHLtbO6XygZYXVGOGSvdmbRs8
 tP5/GyaWvQKDrfHJge2h1bLiufWgk20kBE38Q+DTV7rPATeG9rC6ta3x2vFBejKYEifKG+OOvfyoO
 A18DgC1fp76BLBKoP7VxiTzkqU6ljwgMdFYpN9csriayEV2tMKbt/daU3dxj1UfUI3jIe9d/JquU+
 EdFhoj6gPyuQQPeqoZ3obr1tBUIImUVI8cPSw9OedzYuubwg+rmv+6UgDDuGrLsjA1XB+7nxP1HWd
 PKNzfvUKtg0z47BuQsc4W7Gn5HQROvK2riVA/pwi2h5oSiVs7F2nKe0EwfPfsQxVfP1ZAUQk4q9ho
 Cta0Qjcg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hh0Er-0004Pq-8Q; Fri, 28 Jun 2019 23:25:05 +0000
To: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>
References: <20190628104007.2721479-1-arnd@arndb.de>
 <20190628124422.GA9888@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1d121a83-6042-fc5e-4440-ea0f53f0bc51@infradead.org>
Date: Fri, 28 Jun 2019 16:25:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628124422.GA9888@infradead.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hh0F3-001D6s-L1
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 Wang Shilong <wangshilong1991@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/28/19 5:44 AM, Christoph Hellwig wrote:
> On Fri, Jun 28, 2019 at 12:39:52PM +0200, Arnd Bergmann wrote:
>> Not all architectures support get_user() with a 64-bit argument:
> 
> Which architectures are still missing?  I think we finally need to
> get everyone in line instead of repeatedly working around the lack
> of minor arch support.
> 

arch/microblaze/include/asm/uaccess.c does not support get_user()
with a size of 8.

-- 
~Randy


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
