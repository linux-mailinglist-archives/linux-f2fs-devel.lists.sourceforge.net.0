Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1044119F1B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 00:10:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieoeL-0005QT-Nq; Tue, 10 Dec 2019 23:10:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1ieoeJ-0005QG-Kt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 23:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vFn+qsLVSDPWKB6NmoCCg+7SSHI3Akphn+Aa3++S/Ww=; b=CCmnLlX179M97YejMZB2DzZfX
 1Mv/nqLDnbXb53XZ3TeWgBtUExdhwUqWuqiIx/seFYeUrj8i4jGOO4MqIp4hV6MGiAUrVleyqAKXI
 /KO7+RBxhTjnhmf2Hl/41+N6perVeaSzKnNkQkJdrwvxLHy+tjUC4Gmd1hYkMpoffJCUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vFn+qsLVSDPWKB6NmoCCg+7SSHI3Akphn+Aa3++S/Ww=; b=m/3lzcFXpBtKNLbM6WgUREDpYt
 Ktt8u4GHdqW/TX38L7wDs0LMZP96IDWH7jPmZ4cpdMN7Xm2OuB6eFhj4P1GEuyhifFGm3n6rpd0LP
 /X7ZdH6jRacOeF3WPBGyzyAImkzl+SFlAS1Dz7rBRYPvF5yeTrKh6FUeebC5OHM7bMDU=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieoeF-000L3W-Qj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 23:10:33 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1ieodt-00083G-9G; Tue, 10 Dec 2019 23:10:09 +0000
Date: Tue, 10 Dec 2019 23:10:09 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191210231009.GB4203@ZenIV.linux.org.uk>
References: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
 <20191210191912.GA99557@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210191912.GA99557@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1ieoeF-000L3W-Qj
Subject: Re: [f2fs-dev] [PATCH v4] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 10, 2019 at 11:19:13AM -0800, Eric Biggers wrote:

> > +static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> > +{
> > +	if (unlikely(name[0] == '.')) {
> > +		if (len < 2 || (len == 2 && name[1] == '.'))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> 
> This doesn't handle the len=0 case.  Did you check that none of the users pass
> in zero-length names?  It looks like fscrypt_fname_disk_to_usr() can, if the
> directory entry on-disk has a zero-length name.  Currently it will return
> -EUCLEAN in that case, but with this patch it may think it's the name ".".
> 
> So I think there needs to either be a len >= 1 check added, *or* you need to
> make an argument for why it's okay to not care about the empty name case.

Frankly, the only caller that matters in practice is link_path_walk(); _that_
is by far the hottest path that might make use of that thing.

BTW, the callers that might end up passing 0 for len really ought to take
a good look at another thing - that name[0] is, in fact, mapped.  Something
along the lines of
	if (name + len > end_of_buffer)
		sod off
	if (<that function>(name, len))
		....
is not enough, for obvious reasons.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
