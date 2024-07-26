Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03993D666
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 17:47:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXNAX-0006pO-DL;
	Fri, 26 Jul 2024 15:47:45 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1sXNAV-0006pG-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nr6jgka+gDBT3QQ7bb9PNkdpnMtXeZV68l1U6OfFaqc=; b=jLyaXuvo8q9WgPph/rBEzfEDC0
 inh5IROo1pNfyPOi3nJm62DSPUgnTKBxHsxGKreUWmfVpYGmGPDd4vuzpXvzsjmuyFvdrrPdwaAbS
 AGh8rJmfPx0KMXdWCuRrupz5QXrNmPi0w2mUV/DLgC/oWxAnnrQUS+VeGU+H9YTDSnu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nr6jgka+gDBT3QQ7bb9PNkdpnMtXeZV68l1U6OfFaqc=; b=i+hklXx3s1QGgFknK76DrCIvPn
 3pJNuoJP1qu4JkbPD6N8TibkcEg1GR3dD+92mu6rKp0on8GqP4+I8T7uRQMCbznUxjumnteSd9dyK
 +y9TTMIOdpnz4BC1KKsCecHGgEXWwjBuq7P7Q3eRvXQXiV+3qyHB1iXMLX93CFv1eWF0=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sXNAU-0006O8-IS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:47:43 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC7DE219BF;
 Fri, 26 Jul 2024 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722007360;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr6jgka+gDBT3QQ7bb9PNkdpnMtXeZV68l1U6OfFaqc=;
 b=q3elkxZESedwoEe0iUED5lOQbJV9ZRWPQltOdic0NpXAtJY/EiN5gMmIEUiMWY9yppgng5
 6vHX74SCzYTqbJL/8+DyEy2mSuBbbVz+24XQLb9uAEUi4AUC1Pe9f11DGPMiyjFaWT3w6p
 Cpc3BoFxDn3frW7nxPk+2nBnWffG11I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722007360;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr6jgka+gDBT3QQ7bb9PNkdpnMtXeZV68l1U6OfFaqc=;
 b=947VmE0rAIutWyXfUgWwi60aZCVln6pfnucIC1mlfeI9IcD5vdNjGGIV1jU6UR7rbKu34N
 JxqUY9Is45qfwpAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722007358;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr6jgka+gDBT3QQ7bb9PNkdpnMtXeZV68l1U6OfFaqc=;
 b=Kqbq+to/EyF/FOIb4JQK+wpQDcfHcU09pojkYOkJXt/Nj62vQ62DbUIwyDMnE76fU7JoRl
 h2/v3chroOC3NZ0Ewi2bHzSOBLy8opglAIvdt7tBQnwQtWM5iDPZvq94Ewf73G7p1w2Q0p
 uAi9NZ1qkSPCJ9XKF0LjIlxsF5wjiKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722007358;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr6jgka+gDBT3QQ7bb9PNkdpnMtXeZV68l1U6OfFaqc=;
 b=UfWcXsqCQv+u627gdDOwb0Qe5lzmjOGQVAtU2Gfh5f+O7bTWC5rDTkzRE1A+toGuwfcx7G
 OZMIEwnitR8aabAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9485D1396E;
 Fri, 26 Jul 2024 15:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cGYKJD6/o2bKLgAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Fri, 26 Jul 2024 15:22:38 +0000
Date: Fri, 26 Jul 2024 17:22:37 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20240726152237.GH17473@twin.jikos.cz>
References: <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
 <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZqOs84hdYkSV_YWd@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 HAS_REPLYTO(0.30)[dsterba@suse.cz];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[inwind.it]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[19]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[linux.dev,inwind.it,arndb.de,kernel.org,fb.com,toxicpanda.com,suse.com,mit.edu,dilger.ca,vger.kernel.org,lists.sourceforge.net,kylinos.cn];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_ADDR_EQ_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 26, 2024 at 07:04:35AM -0700, Christoph Hellwig
 wrote: > On Fri, Jul 26, 2024 at 04:54:59PM +0800, Youling Tang wrote: >
 > Based on this patch, we may need to do these things with this > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [195.135.223.130 listed in list.dnswl.org]
X-Headers-End: 1sXNAU-0006O8-IS
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
 kreijack@inwind.it, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 Youling Tang <youling.tang@linux.dev>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2024 at 07:04:35AM -0700, Christoph Hellwig wrote:
> On Fri, Jul 26, 2024 at 04:54:59PM +0800, Youling Tang wrote:
> > Based on this patch, we may need to do these things with this
> >
> >
> > 1. Change the order of *.o in the Makefile (the same order as before the
> > change)
> 
> While we'll need to be careful, we don't need to match the exact
> order.  Most of the calls simply create slab caches / mempools and
> similar things and the order for those does not matter at all.
> 
> Of course the register_filesytem calls need to be last, and sysfs
> registration probably should be second to last, but for the vast
> amount of calls the order does not matter as long as it is unwound
> in reverse order.
> 
> > 2. We need to define module_subinit through the ifdef MODULE
> > distinction,
> 
> Yes.
> 
> > When one of the subinit runs in a module fails, it is difficult
> > to rollback execution of subexit.
> 
> By having both section in the same order, you an just walk the
> exit section backwards from the offset that failed.  Of course that
> only matters for the modular case as normal initcalls don't get
> unwound when built-in either.
> 
> > 4. The order in which subinit is called is not intuitively known
> > (although it can be found in the Makefile).
> 
> Link order through make file is already a well known concept due to
> it mattering for built-in code.

All of this sounds overengineered for something that is a simple array
and two helpers. The code is not finalized so I'll wait for the next
version but specific file order in makefile and linker tricks seems
fragile and I'm not sure I want this for btrfs.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
