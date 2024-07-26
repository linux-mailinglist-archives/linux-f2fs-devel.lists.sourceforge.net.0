Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8193DAC8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2024 00:46:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXThR-0000UF-Og;
	Fri, 26 Jul 2024 22:46:09 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1sXThP-0000U7-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 22:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wEH8Vk8Kw3nyR7i95KJItR4+alXownkC8UVtnwJo0OM=; b=RmhUBrNdrxKQCfjAFHwN+PhkbC
 O6aFAB996aiMj4LYJx14W39X7J5Er+1bCToiRfjOfrog0q4TN9el+LpxUPMkm3LKNebtznWZI8DLj
 JXqL60sevfO3vVTzuqaaO2QCphokLGcN0Dkg3+TaQpgHnTn3XeSSAPrJ+4a9BGW1wMk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wEH8Vk8Kw3nyR7i95KJItR4+alXownkC8UVtnwJo0OM=; b=UrwOAVt7uriYCeqK0lEyqnr58m
 UyW+eWrEaxQM99wfEZLIcGSjBzjOYMSsSNj5Mmr7n/lwC9R+2t6xEWkykJh5MNUF1mBmu8Gch40co
 V3jbu57R02hm223Nz/E5cgSLtjuvwGuqK/EZzdsVqPymACF0UnNc+4OQTDx0djhrTGM0=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sXThL-0004y3-Hn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 22:46:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 25F8221B17;
 Fri, 26 Jul 2024 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722033952;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEH8Vk8Kw3nyR7i95KJItR4+alXownkC8UVtnwJo0OM=;
 b=A1eLqX/o3M7AFIEpMfRvh9UI16KN1MarYEfSLxUe0RcDFUcJJTMzohG8/Enihr7MMxtUYm
 fHpQKSb1thuoBT46Frp0arz9Rhw/cNoJsgJ7SfaIpM4cKz59OTUHO71Eoq5vg/ZKF2awYF
 uqTQchb3NbuddeY6BjyQxGCicc6THvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722033952;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEH8Vk8Kw3nyR7i95KJItR4+alXownkC8UVtnwJo0OM=;
 b=LYynmnwNijUa7IM9Aurpnga1UXlEZyj3zZYcbrjnAkj4RhzIKCV8IErRexqSNbnRzeKkac
 HzPg1zOUZPJ/i+Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722033952;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEH8Vk8Kw3nyR7i95KJItR4+alXownkC8UVtnwJo0OM=;
 b=A1eLqX/o3M7AFIEpMfRvh9UI16KN1MarYEfSLxUe0RcDFUcJJTMzohG8/Enihr7MMxtUYm
 fHpQKSb1thuoBT46Frp0arz9Rhw/cNoJsgJ7SfaIpM4cKz59OTUHO71Eoq5vg/ZKF2awYF
 uqTQchb3NbuddeY6BjyQxGCicc6THvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722033952;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEH8Vk8Kw3nyR7i95KJItR4+alXownkC8UVtnwJo0OM=;
 b=LYynmnwNijUa7IM9Aurpnga1UXlEZyj3zZYcbrjnAkj4RhzIKCV8IErRexqSNbnRzeKkac
 HzPg1zOUZPJ/i+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E52A4138A7;
 Fri, 26 Jul 2024 22:45:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k1NYNx8npGacGAAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Fri, 26 Jul 2024 22:45:51 +0000
Date: Sat, 27 Jul 2024 00:45:42 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20240726224542.GP17473@twin.jikos.cz>
References: <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org>
 <20240726152237.GH17473@twin.jikos.cz>
 <20240726175800.GC131596@mit.edu> <ZqPmPufwqbGOTyGI@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZqPmPufwqbGOTyGI@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 HAS_REPLYTO(0.30)[dsterba@suse.cz];
 MIME_GOOD(-0.10)[text/plain]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[20];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[mit.edu,suse.cz,linux.dev,inwind.it,arndb.de,kernel.org,fb.com,toxicpanda.com,suse.com,dilger.ca,vger.kernel.org,lists.sourceforge.net,kylinos.cn];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLYTO_ADDR_EQ_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[inwind.it]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 26, 2024 at 11:09:02AM -0700, Christoph Hellwig
 wrote: > On Fri, Jul 26, 2024 at 01:58:00PM -0400, Theodore Ts'o wrote: >
 > Yeah, that's my reaction as well. This only saves 50 lines of co [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sXThL-0004y3-Hn
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Reply-To: dsterba@suse.cz
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, kreijack@inwind.it,
 David Sterba <dsterba@suse.cz>, Josef Bacik <josef@toxicpanda.com>,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 Youling Tang <youling.tang@linux.dev>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2024 at 11:09:02AM -0700, Christoph Hellwig wrote:
> On Fri, Jul 26, 2024 at 01:58:00PM -0400, Theodore Ts'o wrote:
> > Yeah, that's my reaction as well.  This only saves 50 lines of code in
> > ext4, and that includes unrelated changes such as getting rid of "int
> > i" and putting the declaration into the for loop --- "for (int i =
> > ...").  Sure, that saves two lines of code, but yay?
> > 
> > If the ordering how the functions gets called is based on the magic
> > ordering in the Makefile, I'm not sure this actually makes the code
> > clearer, more robust, and easier to maintain for the long term.
> 
> So you two object to kernel initcalls for the same reason and would
> rather go back to calling everything explicitly?

No and not my call to do it for the kernel. Somebody probably had a
reason use the initcalls, there are probably practical reasons for that.
Quick grep shows there are thousands of initcalls scattered over the
whole code base, that does ask for some tricks because updating a single
file with explicit calls would be a nightmare. Unlike for a subsystem
inside one directory, like a filesystem.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
