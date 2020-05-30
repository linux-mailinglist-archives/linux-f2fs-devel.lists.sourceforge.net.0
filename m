Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 347491E8E43
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 08:52:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jevMS-0004LJ-IZ; Sat, 30 May 2020 06:52:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1jevMQ-0004LC-Vu
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 06:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KB40/mgrM02LK3uN9xnf5smC3vwmAHkKypNq/bPvgsk=; b=CyicvteCnj0F1tzB8NRg6xStu9
 nRUtWWmisCT9mLXFzy+c94UwUMOPEQjD/PQIC4KcqnCQROLw36MmS+QwitwDoYN/5aAKc4kmhIKzX
 ZZEQ3KjEnYczYJEBuLNjmrFlnLrIZQpzseMVkcBfegIrES6ue6GULh2uraeSUFHC16uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KB40/mgrM02LK3uN9xnf5smC3vwmAHkKypNq/bPvgsk=; b=iMaY2hkFn6rbokFEwg4X7PvTfa
 L5W8zE7K/vDfqOHtYsS0n+D31hM9Pz/P10Jbji16OtVQJ9PRIiH7N4Uv4nvEP9E3a3zv6bjlyhhgd
 K9B3BPLLMZljtTU95Kc1DDkUT5VmqJOGP5ODujBqqA9N1YMavwKDhtZEtSWrY3DqzBv8=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jevMP-000f1V-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 06:52:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 94AE42A03B9
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <85d06mkkv5.fsf@collabora.com>
 <20200530064450.GA317593@sol.localdomain>
Date: Sat, 30 May 2020 02:52:32 -0400
In-Reply-To: <20200530064450.GA317593@sol.localdomain> (Eric Biggers's message
 of "Fri, 29 May 2020 23:44:50 -0700")
Message-ID: <857dwtlxsf.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: qstr.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jevMP-000f1V-AJ
Subject: Re: [f2fs-dev] [PATCH] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Sat, May 30, 2020 at 02:17:02AM -0400, Gabriel Krisman Bertazi wrote:
>> >  > > +	/*
>> > +	 * If the dentry name is stored in-line, then it may be concurrently
>> > +	 * modified by a rename.  If this happens, the VFS will eventually retry
>> > +	 * the lookup, so it doesn't matter what ->d_compare() returns.
>> > +	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
>> > +	 * string.  Therefore, we have to copy the name into a temporary buffer.
>> > +	 */
>> > +	if (len <= DNAME_INLINE_LEN - 1) {
>> > +		unsigned int i;
>> > +
>> > +		for (i = 0; i < len; i++)
>> > +			strbuf[i] = READ_ONCE(str[i]);
>> > +		strbuf[len] = 0;
>> > +		qstr.name = strbuf;
>> > +	}
>> > +
>> 
>> Could we avoid this if the casefolded version were cached in the dentry?
>> Then we could use utf8_strncasecmp_folded which would be safe.  Would
>> this be acceptable for vfs?
>
> The VFS assumes that each dentry has one name, the one in d_name.  That's what
> it passes to ->d_compare(), and that's what it updates in __d_move().
>
> So while ext4 and f2fs could put the casefolded name in ->d_fsdata,
> ->d_compare() wouldn't actually have access to it (unless we added d_fsdata as a
> parameter to ->d_compare()).  Also, the casefolded name would get outdated when
> __d_move() changes d_name.

Thanks for the explanation.  I see.  I was thinking this cached name
could be invalidated if the name changes and all that jazz, but I didn't
understand this code well enough to give it a try.  I hate the need to
do this copy here, though.

Anyway,

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

>
> We could instead make d_name always be the casefolded name.  I'm not sure that
> would be possible, though.  For one, I don't think ->lookup() is allowed to just
> change the dentry name.  It would also make getcwd(), /proc/*/fd/, etc. always
> show casefolded names, which could be problematic.  And probably other issues I
> can't think of off the top of my head.
>
> - Eric

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
