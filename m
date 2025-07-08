Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51483AFC82C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 12:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRx+yTsfXvDu8s3aaNf3cXh2CU6z7b94Silpa86j2dw=; b=BcsjrTfRRW16Uq/vaq+P7DpV+k
	DVRyInhDet4+/N7QhtiKmH2raI63wO9UaMBNS3u2VtGL79WRVxud7/H+U0Di6j6yoJEong/bn/c/h
	CD9EqI37SIu1DLuhw7DbRkbRhNelJvN/2DVlD3hsFVjzGAguvJcFHiCGmCqhFY+kKV8I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ5Qt-0006SW-2k;
	Tue, 08 Jul 2025 10:20:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uZ5Qp-0006SM-1U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 10:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hj1CDaVD+4BtlFnopoRZeD5WKkVDF86m6K5HhWwwKt8=; b=FpHhuoUYuwRXmGPlJDys3/XbUo
 GoX82hxk1ybiDv78CggFFvu3v6PzG/G/JKh5eiDuEDq430tT+g9CoBxd8ZTfyE1kXZVhxK229KTaS
 Gf5ABlRxYBHRrBKmrsjE0NyKgmmOd3FeBEYv8wF+agNNHp/FFm7bHW/4GAm2Juub6qb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hj1CDaVD+4BtlFnopoRZeD5WKkVDF86m6K5HhWwwKt8=; b=dAWNISQc1fIPnNM2PoWVtgEDvT
 xLKJpREOqE3T7uQxOz9mJDfiaIS/F7PpcNX3lSK9bFOFNLdt3/JE23YMQazq9kaYntcRS6fQCcSGE
 +UHX7cbScMx5/THWphIaUjepxLCd/aWszcQYL5miTv3uybHM5nD7hs96YNz00CoFznhg=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uZ5Qn-0006h6-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 10:20:10 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77A321F38D;
 Tue,  8 Jul 2025 10:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751970001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj1CDaVD+4BtlFnopoRZeD5WKkVDF86m6K5HhWwwKt8=;
 b=gvcSW/jbIbPJe4xojVrkaRri64CmwfkMCivzcOcy7X/5Ulw+aCiQctp3+++b5kqbwtKWfd
 XZQLG1KLyBLvSIpnHoUMBP0JhOPCk/9pWF975zNBS2Z89IyO8R3f1A0MnwdyqV1ahHhof+
 2hJTSd2oiBrpFPJh/W1vOOSMyXPKh1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751970001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj1CDaVD+4BtlFnopoRZeD5WKkVDF86m6K5HhWwwKt8=;
 b=JPeLmiN4a6hJiNlYT+wM83pfzh7kRvuR3E14GWwd7cCJViE7FCdJgiAGCQ4t0tbrbV7KE0
 6is/9OuH+76f87BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="gvcSW/jb";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=JPeLmiN4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751970001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj1CDaVD+4BtlFnopoRZeD5WKkVDF86m6K5HhWwwKt8=;
 b=gvcSW/jbIbPJe4xojVrkaRri64CmwfkMCivzcOcy7X/5Ulw+aCiQctp3+++b5kqbwtKWfd
 XZQLG1KLyBLvSIpnHoUMBP0JhOPCk/9pWF975zNBS2Z89IyO8R3f1A0MnwdyqV1ahHhof+
 2hJTSd2oiBrpFPJh/W1vOOSMyXPKh1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751970001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj1CDaVD+4BtlFnopoRZeD5WKkVDF86m6K5HhWwwKt8=;
 b=JPeLmiN4a6hJiNlYT+wM83pfzh7kRvuR3E14GWwd7cCJViE7FCdJgiAGCQ4t0tbrbV7KE0
 6is/9OuH+76f87BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6340A13A54;
 Tue,  8 Jul 2025 10:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9+I3GNHwbGi7eQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 08 Jul 2025 10:20:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id EA382A098F; Tue,  8 Jul 2025 12:20:00 +0200 (CEST)
Date: Tue, 8 Jul 2025 12:20:00 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708004532.GA2672018@frogsfrogsfrogs>
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.com]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_CC(0.00)[gmx.com,fromorbit.com,suse.com,vger.kernel.org,zeniv.linux.org.uk,kernel.org,suse.cz,lists.sourceforge.net,lists.linux.dev];
 DKIM_TRACE(0.00)[suse.cz:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 77A321F38D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon 07-07-25 17:45:32, Darrick J. Wong wrote: > On Tue,
    Jul 08, 2025 at 08:52:47AM +0930, Qu Wenruo wrote: > > 在 2025/7/8 08:32,
    Dave Chinner 写道: > > > On Fri, Jul 04, 2025 at 10:12:29AM +093 [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZ5Qn-0006h6-Ct
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 Dave Chinner <david@fromorbit.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uIDA3LTA3LTI1IDE3OjQ1OjMyLCBEYXJyaWNrIEouIFdvbmcgd3JvdGU6Cj4gT24gVHVl
LCBKdWwgMDgsIDIwMjUgYXQgMDg6NTI6NDdBTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+ID4g
5ZyoIDIwMjUvNy84IDA4OjMyLCBEYXZlIENoaW5uZXIg5YaZ6YGTOgo+ID4gPiBPbiBGcmksIEp1
bCAwNCwgMjAyNSBhdCAxMDoxMjoyOUFNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+ID4g
Q3VycmVudGx5IGFsbCB0aGUgZmlsZXN5c3RlbXMgaW1wbGVtZW50aW5nIHRoZQo+ID4gPiA+IHN1
cGVyX29wZWFyYXRpb25zOjpzaHV0ZG93bigpIGNhbGxiYWNrIGNhbiBub3QgYWZmb3JkIGxvc2lu
ZyBhIGRldmljZS4KPiA+ID4gPiAKPiA+ID4gPiBUaHVzIGZzX2JkZXZfbWFya19kZWFkKCkgd2ls
bCBqdXN0IGNhbGwgdGhlIHNodXRkb3duKCkgY2FsbGJhY2sgZm9yIHRoZQo+ID4gPiA+IGludm9s
dmVkIGZpbGVzeXN0ZW0uCj4gPiA+ID4gCj4gPiA+ID4gQnV0IGl0IHdpbGwgbm8gbG9uZ2VyIGJl
IHRoZSBjYXNlLCB3aXRoIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyBsaWtlCj4gPiA+ID4gYnRy
ZnMgYW5kIGJjYWNoZWZzIHRoZSBmaWxlc3lzdGVtIGNhbiBoYW5kbGUgY2VydGFpbiBkZXZpY2Ug
bG9zcyB3aXRob3V0Cj4gPiA+ID4gc2h1dHRpbmcgZG93biB0aGUgd2hvbGUgZmlsZXN5c3RlbS4K
PiA+ID4gPiAKPiA+ID4gPiBUbyBhbGxvdyB0aG9zZSBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMg
dG8gYmUgaW50ZWdyYXRlZCB0byB1c2UKPiA+ID4gPiBmc19ob2xkZXJfb3BzOgo+ID4gPiA+IAo+
ID4gPiA+IC0gUmVwbGFjZSBzdXBlcl9vcGVhcmF0aW9uOjpzaHV0ZG93bigpIHdpdGgKPiA+ID4g
PiAgICBzdXBlcl9vcGVhcmF0aW9uczo6cmVtb3ZlX2JkZXYoKQo+ID4gPiA+ICAgIFRvIGJldHRl
ciBkZXNjcmliZSB3aGVuIHRoZSBjYWxsYmFjayBpcyBjYWxsZWQuCj4gPiA+IAo+ID4gPiBUaGlz
IGNvbmZsYXRlcyBjYXVzZSB3aXRoIGFjdGlvbi4KPiA+ID4gCj4gPiA+IFRoZSBzaHV0ZG93biBj
YWxsb3V0IGlzIGFuIGFjdGlvbiB0aGF0IHRoZSBmaWxlc3lzdGVtIG11c3QgZXhlY3V0ZSwKPiA+
ID4gd2hpbHN0ICJyZW1vdmUgYmRldiIgaXMgYSBjYXVzZSBub3RpZmljYXRpb24gdGhhdCBtaWdo
dCByZXF1aXJlIGFuCj4gPiA+IGFjdGlvbiB0byBiZSB0YWtlLgo+ID4gPiAKPiA+ID4gWWVzLCB0
aGUgY2F1c2UgY291bGQgYmUgc29tZW9uZSBkb2luZyBob3QtdW5wbHVnIG9mIHRoZSBibG9jawo+
ID4gPiBkZXZpY2UsIGJ1dCBpdCBjb3VsZCBhbHNvIGJlIHNvbWV0aGluZyBnb2luZyB3cm9uZyBp
biBzb2Z0d2FyZQo+ID4gPiBsYXllcnMgYmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUuZy4gZG0tdGhp
bnAgaGF2aW5nIGFuIHVucmVjb3ZlcmFibGUKPiA+ID4gY29ycnVwdGlvbiBvciBFTk9TUEMgZXJy
b3JzLgo+ID4gPiAKPiA+ID4gV2UgYWxyZWFkeSBoYXZlIGEgImNhdXNlIiBub3RpZmljYXRpb246
IGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQoKS4KPiA+ID4gCj4gPiA+IFRoZSBnZW5lcmljIGZz
IGFjdGlvbiB0aGF0IGlzIHRha2VuIGJ5IHRoaXMgbm90aWZpY2F0aW9uIGlzCj4gPiA+IGZzX2Jk
ZXZfbWFya19kZWFkKCkuICBUaGF0IGFjdGlvbiBpcyB0byBpbnZhbGlkYXRlIGNhY2hlcyBhbmQg
c2h1dAo+ID4gPiBkb3duIHRoZSBmaWxlc3lzdGVtLgo+ID4gPiAKPiA+ID4gYnRyZnMgbmVlZHMg
dG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQK
PiA+ID4gbm90aWZpY2F0aW9uLiBpLmUuIGl0IG5lZWRzIGFuIGFjdGlvbiB0aGF0IGlzIGRpZmZl
cmVudCB0bwo+ID4gPiBmc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gPiAKPiA+ID4gSW5kZWVkLCB0
aGlzIGlzIGhvdyBiY2FjaGVmcyBhbHJlYWR5IGhhbmRsZXMgInNpbmdsZSBkZXZpY2UKPiA+ID4g
ZGllZCIgZXZlbnRzIGZvciBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgLSBzZWUKPiA+ID4gYmNo
Ml9mc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gCj4gPiBJIGRvIG5vdCB0aGluayBpdCdzIHRoZSBj
b3JyZWN0IHdheSB0byBnbywgZXNwZWNpYWxseSB3aGVuIHRoZXJlIGlzIGFscmVhZHkKPiA+IGZz
X2hvbGRlcl9vcHMuCj4gPiAKPiA+IFdlJ3JlIGFsd2F5cyBnb2luZyB0b3dhcmRzIGEgbW9yZSBn
ZW5lcmljIHNvbHV0aW9uLCBvdGhlciB0aGFuIGxldHRpbmcgdGhlCj4gPiBpbmRpdmlkdWFsIGZz
IHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+IAo+IE9uIHNlY29u
ZCB0aG91Z2h0IC0tIGl0J3Mgd2VpcmQgdGhhdCB5b3UnZCBmbHVzaCB0aGUgZmlsZXN5c3RlbSBh
bmQKPiBzaHJpbmsgdGhlIGlub2RlL2RlbnRyeSBjYWNoZXMgaW4gYSAieW91ciBkZXZpY2Ugd2Vu
dCBhd2F5IiBoYW5kbGVyLgo+IEZhbmN5IGZpbGVzeXN0ZW1zIGxpa2UgYmNhY2hlZnMgYW5kIGJ0
cmZzIHdvdWxkIGxpa2VseSBqdXN0IHNoaWZ0IElPIHRvCj4gYSBkaWZmZXJlbnQgYmRldiwgcmln
aHQ/ICBBbmQgdGhlcmUncyBubyBnb29kIHJlYXNvbiB0byBydW4gc2hyaW5rZXJzIG9uCj4gZWl0
aGVyIG9mIHRob3NlIGZzZXMsIHJpZ2h0PwoKSSBhZ3JlZSBpdCBpcyBhd2t3YXJkIGFuZCBiY2Fj
aGVmcyBhdm9pZHMgdGhlc2UgaW4gY2FzZSBvZiByZW1vdmFsIGl0IGNhbgpoYW5kbGUgZ3JhY2Vm
dWxseSBBRkFJQ1MuCgo+ID4gWWVzLCB0aGUgbmFtaW5nIGlzIG5vdCBwZXJmZWN0IGFuZCBtaXhp
bmcgY2F1c2UgYW5kIGFjdGlvbiwgYnV0IHRoZSBlbmQKPiA+IHJlc3VsdCBpcyBzdGlsbCBhIG1v
cmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNhdGVkIGNvZGUgYmFzZS4KPiAKPiBJIHRoaW5rIGRj
aGlubmVyIG1ha2VzIGEgZ29vZCBwb2ludCB0aGF0IGlmIHlvdXIgZmlsZXN5c3RlbSBjYW4gZG8K
PiBzb21ldGhpbmcgY2xldmVyIG9uIGRldmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBp
dHMgb3duIGJsb2NrCj4gZGV2aWNlIGhvbGRlciBvcHMgaW5zdGVhZCBvZiB1c2luZyBmc19ob2xk
ZXJfb3BzLiAgSSBkb24ndCB1bmRlcnN0YW5kCj4gd2h5IHlvdSBuZWVkIGEgImdlbmVyaWMiIHNv
bHV0aW9uIGZvciBidHJmcyB3aGVuIGl0J3Mgbm90IGdvaW5nIHRvIGRvCj4gd2hhdCB0aGUgb3Ro
ZXJzIGRvIGFueXdheS4KCldlbGwsIEknZCBhbHNvIHNheSBqdXN0IGdvIGZvciBvd24gZnNfaG9s
ZGVyX29wcyBpZiBpdCB3YXMgbm90IGZvciB0aGUKYXdrd2FyZCAiZ2V0IHN1cGVyIGZyb20gYmRl
diIgc3RlcC4gQXMgQ2hyaXN0aWFuIHdyb3RlIHdlJ3ZlIGVuY2Fwc3VsYXRlZAp0aGF0IGluIGZz
L3N1cGVyLmMgYW5kIGJkZXZfc3VwZXJfbG9jaygpIGluIHBhcnRpY3VsYXIgYnV0IHRoZSBjYWxs
aW5nCmNvbnZlbnRpb25zIGZvciB0aGUgZnNfaG9sZGVyX29wcyBhcmUgbm90IHZlcnkgbmljZSAo
aG9sZGluZwpiZGV2X2hvbGRlcl9sb2NrLCBuZWVkIHRvIHJlbGVhc2UgaXQgYmVmb3JlIGdyYWJi
aW5nIHByYWN0aWNhbGx5IGFueXRoaW5nCmVsc2UpIHNvIEknZCBoYXZlIG11Y2ggZ3JlYXRlciBw
ZWFjZSBvZiBtaW5kIGlmIHRoaXMgZGlkbid0IHNwcmVhZCB0b28KbXVjaC4gT25jZSB5b3UgY2Fs
bCBiZGV2X3N1cGVyX2xvY2soKSBhbmQgaG9sZCBvbiB0byBzYiB3aXRoIHNfdW1vdW50IGhlbGQs
CnRoaW5ncyBhcmUgbXVjaCBtb3JlIGNvbnZlbnRpb25hbCBmb3IgdGhlIGZzIGxhbmQgc28gSSdk
IGxpa2UgaWYgdGhpcwpzdGVwIGhhcHBlbmVkIGJlZm9yZSBhbnkgZnMgaG9vayBnb3QgY2FsbGVk
LiBTbyBJIHByZWZlciBzb21ldGhpbmcgbGlrZQpRdSdzIHByb3Bvc2FsIG9mIHNlcGFyYXRlIHNi
IG9wIGZvciBkZXZpY2UgcmVtb3ZhbCBvdmVyIGV4cG9ydGluZwpiZGV2X3N1cGVyX2xvY2soKS4g
TGlrZToKCnN0YXRpYyB2b2lkIGZzX2JkZXZfbWFya19kZWFkKHN0cnVjdCBibG9ja19kZXZpY2Ug
KmJkZXYsIGJvb2wgc3VycHJpc2UpCnsKICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiOwoK
ICAgICAgICBzYiA9IGJkZXZfc3VwZXJfbG9jayhiZGV2LCBmYWxzZSk7CiAgICAgICAgaWYgKCFz
YikKICAgICAgICAgICAgICAgIHJldHVybjsKCglpZiAoc2ItPnNfb3AtPnJlbW92ZV9iZGV2KSB7
CgkJc2ItPnNfb3AtPnJlbW92ZV9iZGV2KHNiLCBiZGV2LCBzdXJwcmlzZSk7CgkJcmV0dXJuOwoJ
fQoKCWlmICghc3VycHJpc2UpCgkJc3luY19maWxlc3lzdGVtKHNiKTsKCXNocmlua19kY2FjaGVf
c2Ioc2IpOwoJZXZpY3RfaW5vZGVzKHNiKTsKCWlmIChzYi0+c19vcC0+c2h1dGRvd24pCgkJc2It
PnNfb3AtPnNodXRkb3duKHNiKTsKCglzdXBlcl91bmxvY2tfc2hhcmVkKHNiKTsKfQoKPiBBcyBh
biBhc2lkZToKPiAndHdvdWxkIGJlIG5pY2UgaWYgd2UgY291bGQgbGlmdCB0aGUgKkZTX0lPQ19T
SFVURE9XTiBkaXNwYXRjaCBvdXQgb2YKPiBldmVyeW9uZSdzIGlvY3RsIGZ1bmN0aW9ucyBpbnRv
IHRoZSBWRlMsIGFuZCB0aGVuIG1vdmUgdGhlICJJIGFtIGRlYWQiCj4gc3RhdGUgaW50byBzdXBl
cl9ibG9jayBzbyB0aGF0IHlvdSBjb3VsZCBhY3R1YWxseSBzaHV0IGRvd24gYW55Cj4gZmlsZXN5
c3RlbSwgbm90IGp1c3QgdGhlIHNldmVuIHRoYXQgY3VycmVudGx5IGltcGxlbWVudCBpdC4KClll
cywgSSBzaG91bGQgZmluZCB0aW1lIHRvIHJldml2ZSB0aGF0IHBhdGNoIHNlcmllcy4uLiBJdCB3
YXMgbm90ICp0aGF0KgpoYXJkIHRvIGRvLgoKCQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGph
Y2tAc3VzZS5jb20+ClNVU0UgTGFicywgQ1IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
