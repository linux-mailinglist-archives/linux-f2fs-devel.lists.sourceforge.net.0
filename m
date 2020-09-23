Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E0276227
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 22:31:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLBPv-0004PY-Tl; Wed, 23 Sep 2020 20:31:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1kLBPu-0004PL-NB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 20:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZF+60CHg/BC1ljaATYS2ajzuq3zBkpLEZWbLRHtPIM=; b=UtYtiHpFcvyRyd5B/DxYmQYMX1
 Y9tzcKRy1dBFd3ScUwViFVQQq5ngBleSJrBrpvrOzYb27kolL1mivAjkpmd8JZZ2MAdMM5zRKV7rf
 6dbOXt4dUJ1COxDEvKPusVEkQVWK5+ZZ9uHBi+NUFsszczSgCLF4z7jkmbjqPsC6I1qY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RZF+60CHg/BC1ljaATYS2ajzuq3zBkpLEZWbLRHtPIM=; b=GkeATj5TWJsnGaizBgIHbTQlSx
 qmcLqgL7d7dCW8/gd2N+1tlhSHkT3Ng/L4nfHSS/9vRoLuViK0jS266S8fsvQBDQ+VBxI68T5qfeB
 uUGtlrRdKvBgb50v/aQ+3LaOncoZ4J0dpg5o9zcoAcBVioOPtS3DS/UkTgOMw7xXtJjg=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLBPs-0031bF-FZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 20:31:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 3695329C66D
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-2-drosen@google.com>
 <20200923054714.GB9538@sol.localdomain>
Date: Wed, 23 Sep 2020 16:30:45 -0400
In-Reply-To: <20200923054714.GB9538@sol.localdomain> (Eric Biggers's message
 of "Tue, 22 Sep 2020 22:47:14 -0700")
Message-ID: <87o8lw5j7u.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kLBPs-0031bF-FZ
Subject: Re: [f2fs-dev] [PATCH 1/5] ext4: Use generic casefolding support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Wed, Sep 23, 2020 at 01:01:47AM +0000, Daniel Rosenberg wrote:
>> This switches ext4 over to the generic support provided in
>> the previous patch.
>> 
>> Since casefolded dentries behave the same in ext4 and f2fs, we decrease
>> the maintenance burden by unifying them, and any optimizations will
>> immediately apply to both.
>> 
>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>> Reviewed-by: Eric Biggers <ebiggers@google.com>
>
> You could also add Gabriel's Reviewed-by from last time:
> https://lkml.kernel.org/linux-fsdevel/87lfh4djdq.fsf@collabora.com/

Yep, I was gonna say that. Assuming nothing changed from the last
submission in the other series.

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
