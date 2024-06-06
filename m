Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EC8FF70B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2024 23:51:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFL0i-0006Yh-9z;
	Thu, 06 Jun 2024 21:51:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1sFL0g-0006YY-0M
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 21:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PQTf0zBkx+6dYehfEwHIIeqVqSDrnQHWK9tVjpEW7s4=; b=luOHRUJGXI/exrlpekNfsFmdNX
 zQVSRVCroZ6E5io8JPkcNKjrKMdDIvQ7OSoxjRuSUWyCOrMUu/rQVfZOUERmhCxA16fOGZc1TdHJA
 HVvwrsMO5QA3oDYFpbNeyNE60oxa0O5NdWG9L1Fq4QgI1n6iz7CBti4Fd/4miMdgfXow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PQTf0zBkx+6dYehfEwHIIeqVqSDrnQHWK9tVjpEW7s4=; b=jl36c0n3h4kxQ7vwRt0ShRFoeB
 1mrl3g6F4uzxXQAh+bsB43UTOhB3Np/e+xllgWt+wc7iwbsWoTatmQPDot/7SmjzO/p8f/oU7TRFh
 U4ZUQCD1GWyYEE9Y4s9n7r25X87wl8el3iCkiJYCY0YA2yU/ZIlE5xOZqeArplDtbv8k=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sFL0g-0002JV-ME for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 21:51:03 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B7351FB5A;
 Thu,  6 Jun 2024 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717710650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQTf0zBkx+6dYehfEwHIIeqVqSDrnQHWK9tVjpEW7s4=;
 b=XF0+T9vu3aR4QBcisT3dppVXlPEF6SyNqm6k9wGy24cFhwtxuQNSfqsQu4lliWc5St//hy
 txATNenfL3qtEnEze4CdH4Whz1UU0uGdZC8JQEePOJUC3ZGiIF5ukiox5bmcCpggWtGCpu
 RtxcJNOMth9Y2JGfkbufuqe49WVj7V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717710650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQTf0zBkx+6dYehfEwHIIeqVqSDrnQHWK9tVjpEW7s4=;
 b=HO9NPha7lz19I5x9wkNaD7XGnXuuqb7e+TSrgf1sGir4rQMJ2RT+JrTf3Qiob7SGgJTY3R
 QTLl5ogL0xScvUCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717710650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQTf0zBkx+6dYehfEwHIIeqVqSDrnQHWK9tVjpEW7s4=;
 b=XF0+T9vu3aR4QBcisT3dppVXlPEF6SyNqm6k9wGy24cFhwtxuQNSfqsQu4lliWc5St//hy
 txATNenfL3qtEnEze4CdH4Whz1UU0uGdZC8JQEePOJUC3ZGiIF5ukiox5bmcCpggWtGCpu
 RtxcJNOMth9Y2JGfkbufuqe49WVj7V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717710650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQTf0zBkx+6dYehfEwHIIeqVqSDrnQHWK9tVjpEW7s4=;
 b=HO9NPha7lz19I5x9wkNaD7XGnXuuqb7e+TSrgf1sGir4rQMJ2RT+JrTf3Qiob7SGgJTY3R
 QTLl5ogL0xScvUCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1394313A79;
 Thu,  6 Jun 2024 21:50:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4jzcOTkvYmaTXAAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 06 Jun 2024 21:50:49 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: "Eugen Hristev" <eugen.hristev@collabora.com>, "Christian Brauner"
 <christian@brauner.io>
In-Reply-To: <20240606073353.47130-1-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Thu, 6 Jun 2024 10:33:46 +0300")
Organization: SUSE
References: <20240606073353.47130-1-eugen.hristev@collabora.com>
Date: Thu, 06 Jun 2024 17:50:38 -0400
Message-ID: <87v82livv5.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.981]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; HAS_ORG_HEADER(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eugen Hristev <eugen.hristev@collabora.com> writes: > Hello, 
 > > I am trying to respin the series here : >
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 > > I resent some of the v9 patches and got some reviews from Gabriel, >
 I did changes as [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: spinics.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.131 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.131 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFL0g-0002JV-ME
Subject: Re: [f2fs-dev] [PATCH v18 0/7] Case insensitive cleanup for
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 ebiggers@google.com, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> Hello,
>
> I am trying to respin the series here :
> https://www.spinics.net/lists/linux-ext4/msg85081.html
>
> I resent some of the v9 patches and got some reviews from Gabriel,
> I did changes as requested and here is v18.

The patchset looks good to me.  Feel free to add:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Bringing Christian into the loop, since this is getting ready and it
should go through the VFS tree, as it touches libfs and a couple
filesystems.

Christian, can you please take a look? Eric has also been involved in
the review, so we should give him a few days to see if he has more
comments.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
