Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BC589A2A0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Apr 2024 18:37:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsmZF-0005s2-2d;
	Fri, 05 Apr 2024 16:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rsmZD-0005rk-6I
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 16:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9b6bVC5wHtPZFe+lwb/5F0DCN1XHlga3Dp0t9Yx4D6E=; b=Q4I1NydifJ40nrYCx8e6L7QZ3S
 0bMrp6gJCi1uWExD19JkXwfqT0nfV99j6sZ3LzQzWKpJSx0cAt6FkLwPzFKewnDA+7p02ZvzQDLUh
 waKB9lOZbm3bfen9BbTGD1jcT9MKVjnEoZZTLlPF3eIh/jVIDcV33bfw3mQv9Tga6GfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9b6bVC5wHtPZFe+lwb/5F0DCN1XHlga3Dp0t9Yx4D6E=; b=jfjzbM8yZn8OnQajHuyYi3qHBc
 ApHm9haaKAvjP2AX96FnmzdVlz66b4N9T+9vHeUcpOd8Wnq/Ctpt9kdmbu0iY109tF7Ft8LGP/BlD
 0m560sGq03/Xi+fS7CTXVoXdaf0/JNNhMaR4O35TqFoMTmui9odUqPumQBd1kKTu1jGI=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rsmZB-0006Xp-HL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 16:37:27 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 417FD21ABB;
 Fri,  5 Apr 2024 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712335034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b6bVC5wHtPZFe+lwb/5F0DCN1XHlga3Dp0t9Yx4D6E=;
 b=W/kTTz5a0vf6qCbYd530AH8Ld3LbgdAvwrl0o7mQRnx++sK7lsXO8cVDnspMF3EtOiFfjQ
 WLF1c0RrSGfafJ5DK84sZcOqa+r0iDAUUK5jXG/Eaq1O4tbnQKhwe9egaX0XsVi2stjctD
 S8iinN3fNaL1br9CIG528txeUo1AqHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712335034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b6bVC5wHtPZFe+lwb/5F0DCN1XHlga3Dp0t9Yx4D6E=;
 b=riYSMPLfFTJTaeD9N5m3QqVojPpAR+UoMNiolx4g/5uczTHbCJoXBox2cOjheK1LSwgJ/W
 pjdwpvQXkjkVpWAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="W/kTTz5a";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=riYSMPLf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712335034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b6bVC5wHtPZFe+lwb/5F0DCN1XHlga3Dp0t9Yx4D6E=;
 b=W/kTTz5a0vf6qCbYd530AH8Ld3LbgdAvwrl0o7mQRnx++sK7lsXO8cVDnspMF3EtOiFfjQ
 WLF1c0RrSGfafJ5DK84sZcOqa+r0iDAUUK5jXG/Eaq1O4tbnQKhwe9egaX0XsVi2stjctD
 S8iinN3fNaL1br9CIG528txeUo1AqHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712335034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b6bVC5wHtPZFe+lwb/5F0DCN1XHlga3Dp0t9Yx4D6E=;
 b=riYSMPLfFTJTaeD9N5m3QqVojPpAR+UoMNiolx4g/5uczTHbCJoXBox2cOjheK1LSwgJ/W
 pjdwpvQXkjkVpWAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E3926139E8;
 Fri,  5 Apr 2024 16:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id dhBHK7koEGblbwAAn2gu4w
 (envelope-from <krisman@suse.de>); Fri, 05 Apr 2024 16:37:13 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <ec3a3946-d6d6-40e1-8645-34b258d8b507@collabora.com> (Eugen
 Hristev's message of "Fri, 5 Apr 2024 16:02:15 +0300")
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <Zg_sF1uPG4gdnJxI@casper.infradead.org>
 <ec3a3946-d6d6-40e1-8645-34b258d8b507@collabora.com>
Date: Fri, 05 Apr 2024 12:37:12 -0400
Message-ID: <87le5r3gw7.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:dkim,wikipedia.org:url];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 417FD21ABB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > On
 4/5/24
 15:18, Matthew Wilcox wrote: >> On Fri, Apr 05, 2024 at 03:13:23PM +0300,
 Eugen Hristev wrote: >>> Hello, >>> >>> I am trying to respin the series
 here : >>> https://www.spinics.net/lists/ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rsmZB-0006Xp-HL
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> On 4/5/24 15:18, Matthew Wilcox wrote:
>> On Fri, Apr 05, 2024 at 03:13:23PM +0300, Eugen Hristev wrote:
>>> Hello,
>>>
>>> I am trying to respin the series here :
>>> https://www.spinics.net/lists/linux-ext4/msg85081.html
>> 
>> The subject here is "Cache insensitive cleanup for ext4/f2fs".
>> Cache insensitive means something entirely different
>> https://en.wikipedia.org/wiki/Cache-oblivious_algorithm
>> 
>> I suspect you mean "Case insensitive".
>
> You are correct, I apologize for the typo.

Heh. I completely missed it in the previous submissions. I guess we both
just mentally auto-corrected.

Since we are here, I think I contributed to the typo in the cover letter
with the summary lines of patch 1 and 2.  Differently from the rest of
the series, these two are actually working on a "cache of
casefolded strings".  But their summary lines are misleading.

Can you rename them to:

[PATCH v16 1/9] ext4: Simplify the handling of cached casefolded names
[PATCH v16 2/9] f2fs: Simplify the handling of cached casefolded names

From a quick look, the series is looking good and the strict mode issue
pointed in the last iteration seems fixed, though I didn't run it yet.
I'll take a closer look later today and fully review.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
