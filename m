Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF6AFEFBC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 19:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v62yWSnUmDSC3owXybBat8/T1neayXPIWb2gnVwgetc=; b=BUmPuqCVvOUspCBA5+VlrjafuR
	t0eTEo3dIYPFjJ1ffOpS7P1poUUDg985G8/vxpncemKijWVWZYT3LLEtXfjW755YMTy2NMgCzXYQZ
	XyX/90s92eoHmgMPNZBcCrwRTs1cODU9GEBW78vKqAfvhCrD9XBUnxtusXo80zhFAicw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZYVu-0001Wq-Ab;
	Wed, 09 Jul 2025 17:23:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uZYVs-0001Wi-Re
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 17:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CC+sITaj/SX+l6M3xryuVDKN0uxVFK1sOBgicJxYht8=; b=l44zwbbYetmmmyR3UCpXe7tMKg
 RFnciRJFfSwMNYcvmrgq5q6ydTgctCFE/WVBP1CXEQDU9TwxIhT5tihLDPNNqe+/k7Kcrrd4EOqx2
 eEqnmM2f0fOxb1eLGTMt4KvjJuZmru862QtKtgAfnf50WadbnCUuF1exZojcnt6q63fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CC+sITaj/SX+l6M3xryuVDKN0uxVFK1sOBgicJxYht8=; b=A
 JRoukeRFJ7IY8teAVfXTBS5nGCxficODwruCrzprlm+brw/Eyxn2VAtN7jyvqrM7MBe30eR2z/M2E
 5iUv1g0amdkUT/VrTyF7KyVOwGwqYZ2yHct8FFckzKdBpQQxCCSDiAKQ2coDijBjgU0z6nbWXEeI5
 W3mF0zn9AZu1hCfU=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uZYVr-0006ZI-OK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 17:23:20 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B22EC2117A;
 Wed,  9 Jul 2025 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752081788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CC+sITaj/SX+l6M3xryuVDKN0uxVFK1sOBgicJxYht8=;
 b=lrtqxg0H1oHdRhpeVDqsfF0jwsTZRp+1UW+HoKB7Ar3SPhbDVX2YWrdqpqp2OahdYFramu
 Cn5jdABzK7odyjvf1dFYABXqHRs4QTi86JTw9pwzP7g5iedq7nX8nzx97GlZNHGD2GrzZj
 hVZYetUA+B3xdI7RiAN7orS+RIaDZOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752081788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CC+sITaj/SX+l6M3xryuVDKN0uxVFK1sOBgicJxYht8=;
 b=BcWGmaiwk5rfrY2cCRW+UhD3p8GJgvAytQYAcd/mkwlrlvCTJyk/Tl/jFpD+V18B+EhTXq
 8m6PspGYMjIIFQBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752081787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CC+sITaj/SX+l6M3xryuVDKN0uxVFK1sOBgicJxYht8=;
 b=AJoWVpOV56vkSVcv6MRSAVnN+fCovzvMso4Gmd7m522WNv6fUyv7PgxY65ajGU28NYMk+Z
 SYmQDI/e7QRKAWiDK23RXqEX9gQrt/v2/GxWoEet2h77Jt0n59A3Jf7s+wOCHonoFjFJgQ
 +lggTc1pTzzQHGAeqRz1scGNTLY0Yws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752081787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CC+sITaj/SX+l6M3xryuVDKN0uxVFK1sOBgicJxYht8=;
 b=TL+oxa4x5HVSeFOOVnZbN20Kr3T/kNhk4mP74dqSzQSbR8Phj9mtdSonllbxlOwKAMwrnP
 yZPrtli/rPlKOdAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B43D13757;
 Wed,  9 Jul 2025 17:23:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LVzgJXulbmhoJwAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 09 Jul 2025 17:23:07 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1D212A09C3; Wed,  9 Jul 2025 19:23:07 +0200 (CEST)
Date: Wed, 9 Jul 2025 19:23:07 +0200
From: Jan Kara <jack@suse.cz>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <343vlonfhw76mnbjnysejihoxsjyp2kzwvedhjjjml4ccaygbq@72m67s3e2ped>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; FAKE_REPLY(1.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmx.com,suse.com,vger.kernel.org,zeniv.linux.org.uk,suse.cz,lists.sourceforge.net,lists.linux.dev,linux.dev];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Bcc: Subject: Re: [PATCH v4 1/6] fs: enhance and rename
 shutdown() callback to remove_bdev() Reply-To: In-Reply-To:
 <aG2i3qP01m-vmFVE@dread.disaster.area>
 On Wed 09-07-25 08:59:42, Dave Chinner wrote: > On Tue, Jul 08,
 2025 at 09:55:14AM
 +0200, Christian Brauner wrote: > > On Mon, Jul 07, 2025 at 05:45:32PM -0700, 
 Darrick J. Wong wrote: > > > On Tue, Ju [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZYVr-0006ZI-OK
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev, jack@suse.cz,
 "Darrick J. Wong" <djwong@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QmNjOgpTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvNl0gZnM6IGVuaGFuY2UgYW5kIHJlbmFtZSBz
aHV0ZG93bigpIGNhbGxiYWNrIHRvCiByZW1vdmVfYmRldigpClJlcGx5LVRvOgpJbi1SZXBseS1U
bzogPGFHMmkzcVAwMW0tdm1GVkVAZHJlYWQuZGlzYXN0ZXIuYXJlYT4KCk9uIFdlZCAwOS0wNy0y
NSAwODo1OTo0MiwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0
IDA5OjU1OjE0QU0gKzAyMDAsIENocmlzdGlhbiBCcmF1bmVyIHdyb3RlOgo+ID4gT24gTW9uLCBK
dWwgMDcsIDIwMjUgYXQgMDU6NDU6MzJQTSAtMDcwMCwgRGFycmljayBKLiBXb25nIHdyb3RlOgo+
ID4gPiBPbiBUdWUsIEp1bCAwOCwgMjAyNSBhdCAwODo1Mjo0N0FNICswOTMwLCBRdSBXZW5ydW8g
d3JvdGU6Cj4gPiA+ID4g5ZyoIDIwMjUvNy84IDA4OjMyLCBEYXZlIENoaW5uZXIg5YaZ6YGTOgo+
ID4gPiA+ID4gT24gRnJpLCBKdWwgMDQsIDIwMjUgYXQgMTA6MTI6MjlBTSArMDkzMCwgUXUgV2Vu
cnVvIHdyb3RlOgo+ID4gPiA+ID4gPiBDdXJyZW50bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBpbXBs
ZW1lbnRpbmcgdGhlCj4gPiA+ID4gPiA+IHN1cGVyX29wZWFyYXRpb25zOjpzaHV0ZG93bigpIGNh
bGxiYWNrIGNhbiBub3QgYWZmb3JkIGxvc2luZyBhIGRldmljZS4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IFRodXMgZnNfYmRldl9tYXJrX2RlYWQoKSB3aWxsIGp1c3QgY2FsbCB0aGUgc2h1dGRv
d24oKSBjYWxsYmFjayBmb3IgdGhlCj4gPiA+ID4gPiA+IGludm9sdmVkIGZpbGVzeXN0ZW0uCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBCdXQgaXQgd2lsbCBubyBsb25nZXIgYmUgdGhlIGNhc2Us
IHdpdGggbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIGxpa2UKPiA+ID4gPiA+ID4gYnRyZnMgYW5k
IGJjYWNoZWZzIHRoZSBmaWxlc3lzdGVtIGNhbiBoYW5kbGUgY2VydGFpbiBkZXZpY2UgbG9zcyB3
aXRob3V0Cj4gPiA+ID4gPiA+IHNodXR0aW5nIGRvd24gdGhlIHdob2xlIGZpbGVzeXN0ZW0uCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUbyBhbGxvdyB0aG9zZSBtdWx0aS1kZXZpY2UgZmlsZXN5
c3RlbXMgdG8gYmUgaW50ZWdyYXRlZCB0byB1c2UKPiA+ID4gPiA+ID4gZnNfaG9sZGVyX29wczoK
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IC0gUmVwbGFjZSBzdXBlcl9vcGVhcmF0aW9uOjpzaHV0
ZG93bigpIHdpdGgKPiA+ID4gPiA+ID4gICAgc3VwZXJfb3BlYXJhdGlvbnM6OnJlbW92ZV9iZGV2
KCkKPiA+ID4gPiA+ID4gICAgVG8gYmV0dGVyIGRlc2NyaWJlIHdoZW4gdGhlIGNhbGxiYWNrIGlz
IGNhbGxlZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBjb25mbGF0ZXMgY2F1c2Ugd2l0aCBh
Y3Rpb24uCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBzaHV0ZG93biBjYWxsb3V0IGlzIGFuIGFj
dGlvbiB0aGF0IHRoZSBmaWxlc3lzdGVtIG11c3QgZXhlY3V0ZSwKPiA+ID4gPiA+IHdoaWxzdCAi
cmVtb3ZlIGJkZXYiIGlzIGEgY2F1c2Ugbm90aWZpY2F0aW9uIHRoYXQgbWlnaHQgcmVxdWlyZSBh
bgo+ID4gPiA+ID4gYWN0aW9uIHRvIGJlIHRha2UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcywg
dGhlIGNhdXNlIGNvdWxkIGJlIHNvbWVvbmUgZG9pbmcgaG90LXVucGx1ZyBvZiB0aGUgYmxvY2sK
PiA+ID4gPiA+IGRldmljZSwgYnV0IGl0IGNvdWxkIGFsc28gYmUgc29tZXRoaW5nIGdvaW5nIHdy
b25nIGluIHNvZnR3YXJlCj4gPiA+ID4gPiBsYXllcnMgYmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUu
Zy4gZG0tdGhpbnAgaGF2aW5nIGFuIHVucmVjb3ZlcmFibGUKPiA+ID4gPiA+IGNvcnJ1cHRpb24g
b3IgRU5PU1BDIGVycm9ycy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gV2UgYWxyZWFkeSBoYXZlIGEg
ImNhdXNlIiBub3RpZmljYXRpb246IGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQoKS4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhlIGdlbmVyaWMgZnMgYWN0aW9uIHRoYXQgaXMgdGFrZW4gYnkgdGhp
cyBub3RpZmljYXRpb24gaXMKPiA+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFkKCkuICBUaGF0IGFj
dGlvbiBpcyB0byBpbnZhbGlkYXRlIGNhY2hlcyBhbmQgc2h1dAo+ID4gPiA+ID4gZG93biB0aGUg
ZmlsZXN5c3RlbS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gYnRyZnMgbmVlZHMgdG8gZG8gc29tZXRo
aW5nIGRpZmZlcmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQKPiA+ID4gPiA+IG5v
dGlmaWNhdGlvbi4gaS5lLiBpdCBuZWVkcyBhbiBhY3Rpb24gdGhhdCBpcyBkaWZmZXJlbnQgdG8K
PiA+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFkKCkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEluZGVl
ZCwgdGhpcyBpcyBob3cgYmNhY2hlZnMgYWxyZWFkeSBoYW5kbGVzICJzaW5nbGUgZGV2aWNlCj4g
PiA+ID4gPiBkaWVkIiBldmVudHMgZm9yIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyAtIHNlZQo+
ID4gPiA+ID4gYmNoMl9mc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gPiA+IAo+ID4gPiA+IEkgZG8g
bm90IHRoaW5rIGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBlc3BlY2lhbGx5IHdoZW4gdGhl
cmUgaXMgYWxyZWFkeQo+ID4gPiA+IGZzX2hvbGRlcl9vcHMuCj4gPiA+ID4gCj4gPiA+ID4gV2Un
cmUgYWx3YXlzIGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRo
YW4gbGV0dGluZyB0aGUKPiA+ID4gPiBpbmRpdmlkdWFsIGZzIHRvIGRvIHRoZSBzYW1lIHRoaW5n
IHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+ID4gPiAKPiA+ID4gT24gc2Vjb25kIHRob3VnaHQgLS0g
aXQncyB3ZWlyZCB0aGF0IHlvdSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+ID4gPiBzaHJp
bmsgdGhlIGlub2RlL2RlbnRyeSBjYWNoZXMgaW4gYSAieW91ciBkZXZpY2Ugd2VudCBhd2F5IiBo
YW5kbGVyLgo+ID4gPiBGYW5jeSBmaWxlc3lzdGVtcyBsaWtlIGJjYWNoZWZzIGFuZCBidHJmcyB3
b3VsZCBsaWtlbHkganVzdCBzaGlmdCBJTyB0bwo+ID4gPiBhIGRpZmZlcmVudCBiZGV2LCByaWdo
dD8gIEFuZCB0aGVyZSdzIG5vIGdvb2QgcmVhc29uIHRvIHJ1biBzaHJpbmtlcnMgb24KPiA+ID4g
ZWl0aGVyIG9mIHRob3NlIGZzZXMsIHJpZ2h0Pwo+ID4gPiAKPiA+ID4gPiBZZXMsIHRoZSBuYW1p
bmcgaXMgbm90IHBlcmZlY3QgYW5kIG1peGluZyBjYXVzZSBhbmQgYWN0aW9uLCBidXQgdGhlIGVu
ZAo+ID4gPiA+IHJlc3VsdCBpcyBzdGlsbCBhIG1vcmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNh
dGVkIGNvZGUgYmFzZS4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBnb29k
IHBvaW50IHRoYXQgaWYgeW91ciBmaWxlc3lzdGVtIGNhbiBkbwo+ID4gPiBzb21ldGhpbmcgY2xl
dmVyIG9uIGRldmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBpdHMgb3duIGJsb2NrCj4g
PiA+IGRldmljZSBob2xkZXIgb3BzIGluc3RlYWQgb2YgdXNpbmcgZnNfaG9sZGVyX29wcy4gIEkg
ZG9uJ3QgdW5kZXJzdGFuZAo+ID4gPiB3aHkgeW91IG5lZWQgYSAiZ2VuZXJpYyIgc29sdXRpb24g
Zm9yIGJ0cmZzIHdoZW4gaXQncyBub3QgZ29pbmcgdG8gZG8KPiA+ID4gd2hhdCB0aGUgb3RoZXJz
IGRvIGFueXdheS4KPiA+IAo+ID4gSSB0aGluayBsZXR0aW5nIGZpbGVzeXN0ZW1zIGltcGxlbWVu
dCB0aGVpciBvd24gaG9sZGVyIG9wcyBzaG91bGQgYmUKPiA+IGF2b2lkZWQgaWYgd2UgY2FuLiBD
aHJpc3RvcGggbWF5IGNoaW1lIGluIGhlcmUuIEkgaGF2ZSBubyBhcHBldHRpdGUgZm9yCj4gPiBl
eHBvcnRpbmcgc3R1ZmYgbGlrZSBnZXRfYmRldl9zdXBlcigpIHVubGVzcyBhYnNvbHV0ZWx5IG5l
Y2Vzc2FyeS4gV2UKPiA+IHRyaWVkIHRvIG1vdmUgYWxsIHRoYXQgaGFuZGxpbmcgaW50byB0aGUg
VkZTIHRvIGVsaW1pbmF0ZSBhIHNsZXcgb2YKPiA+IGRlYWRsb2NrcyB3ZSBkZXRlY3RlZCBhbmQg
Zml4ZWQuIEkgaGF2ZSBubyBhcHBldGl0ZSB0byByZXBlYXQgdGhhdAo+ID4gY3ljbGUuCj4gCj4g
RXhjZXB0IGl0IGlzbid0IGFjdHVhbGx5IG5lY2Vzc2FyeS4KPiAKPiBFdmVyeW9uZSBoZXJlIHNl
ZW1zIHRvIGJlIGFzc3VtaW5nIHRoYXQgdGhlIGZpbGVzeXN0ZW0gKm11c3QqIHRha2UKPiBhbiBh
Y3RpdmUgc3VwZXJibG9jayByZWZlcmVuY2UgdG8gcHJvY2VzcyBhIGRldmljZSByZW1vdmFsIGV2
ZW50LAo+IGFuZCB0aGF0IGlzICpzaW1wbHkgbm90IHRydWUqLgo+IAo+IGJjYWNoZWZzIGRvZXMg
bm90IHVzZSBnZXRfYmRldl9zdXBlcigpIG9yIGFuIGFjdGl2ZSBzdXBlcmJsb2NrCj4gcmVmZXJl
bmNlIHRvIHByb2Nlc3MgLT5tYXJrX2RlYWQgZXZlbnRzLgo+Cj4gSXQgaGFzIGl0J3Mgb3duIGlu
dGVybmFsIHJlZmVyZW5jZSBjb3VudGluZyBvbiB0aGUgc3RydWN0IGJjaF9mcwo+IGF0dGFjaGVk
IHRvIHRoZSBiZGV2IHRoYXQgZW5zdXJlcyB0aGUgZmlsZXN5c3RlbSBzdHJ1Y3R1cmVzIGNhbid0
IGdvCj4gYXdheSB3aGlsc3QgLT5tYXJrX2RlYWQgaXMgYmVpbmcgcHJvY2Vzc2VkLiAgaS5lLiBi
Y2FjaGVmcyBpcyBvbmx5Cj4gZGVwZW5kZW50IG9uIHRoZSBiZGV2LT5iZF9ob2xkZXJfbG9jaygp
IGJlaW5nIGhlbGQgd2hlbgo+IC0+bWFya19kZWFkKCkgaXMgY2FsbGVkIGFuZCBkb2VzIG5vdCBy
ZWx5IG9uIHRoZSBWRlMgZm9yIGFueXRoaW5nLgoKUmlnaHQsIHRoZXkgaGF2ZSB0aGVpciBvd24g
cmVmY291bnQgd2hpY2ggZWZmZWN0aXZlbHkgYmxvY2tzIHVtb3VudAppbiAucHV0X3N1cGVyIEFG
QUlDUyBhbmQgdGhleSB1c2UgaXQgaW5zdGVhZCBvZiBWRlMgcmVmY291bnRzIGZvciB0aGlzLgoK
PiBUaGlzIG1lYW5zIHRoYXQgZGV2aWNlIHJlbW92YWwgcHJvY2Vzc2luZyBjYW4gYmUgcGVyZm9y
bWVkCj4gd2l0aG91dCBnbG9iYWwgZmlsZXN5c3RlbS9WRlMgbG9ja3MgbmVlZGluZyB0byBiZSBo
ZWxkLiBIZW5jZSBpc3N1ZXMKPiBsaWtlIHJlLWVudHJhbmN5IGRlYWRsb2NrcyB3aGVuIHRoZXJl
IGFyZSBjb25jdXJyZW50L2Nhc2NhZGluZwo+IGRldmljZSBmYWlsdXJlcyAoZS5nLiBhIEhCQSBk
aWVzLCB0YWtpbmcgb3V0IG11bHRpcGxlIGRldmljZXMKPiBzaW11bHRhbmVvdXNseSkgYXJlIGNv
bXBsZXRlbHkgYXZvaWRlZC4uLgoKRnVubmlseSBlbm91Z2ggaG93IGFib3V0OgoKYmNoMl9mc19i
ZGV2X21hcmtfZGVhZCgpCQl1bW91bnQoKQogIGJkZXZfZ2V0X2ZzKCkKICAgIGJjaDJfcm9fcmVm
X3RyeWdldCgpIC0+IGdyYWJzIGJjaF9mcy0+cm9fcmVmCiAgICBtdXRleF91bmxvY2soJmJkZXYt
PmJkX2hvbGRlcl9sb2NrKTsKCQkJCQlkZWFjdGl2YXRlX3N1cGVyKCkKCQkJCQkgIGRvd25fd3Jp
dGUoJnNiLT5zX3Vtb3VudCk7CgkJCQkJICBkZWFjdGl2YXRlX2xvY2tlZF9zdXBlcigpCgkJCQkJ
ICAgIGJjaDJfa2lsbF9zYigpCgkJCQkJICAgICAgZ2VuZXJpY19zaHV0ZG93bl9zdXBlcigpCgkJ
CQkJICAgICAgICBiY2gyX3B1dF9zdXBlcigpCgkJCQkJCSAgX19iY2gyX2ZzX3N0b3AoKQoJCQkJ
CQkgICAgYmNoMl9yb19yZWZfcHV0KCkKCQkJCQkJICAgIHdhaXRfZXZlbnQoYy0+cm9fcmVmX3dh
aXQsICFyZWZjb3VudF9yZWFkKCZjLT5yb19yZWYpKTsKICBzYiA9IGMtPnZmc19zYjsKICBkb3du
X3JlYWQoJnNiLT5zX3Vtb3VudCk7IC0+IGRlYWRsb2NrCgpXaGljaCBpcyBhIGNhc2UgaW4gcG9p
bnQgd2h5IEkgd291bGQgbGlrZSB0byBoYXZlIGEgc2hhcmVkIGluZnJhc3RydWN0dXJlCmZvciBi
ZGV2IC0+IHNiIHRyYW5zaXRpb24gdGhhdCdzIHVzZWQgYXMgd2lkZWx5IGFzIHBvc3NpYmxlLiBC
ZWNhdXNlIGl0Cmlzbid0IGVhc3kgdG8gZ2V0IHRoZSBsb2NrIG9yZGVyaW5nIHJpZ2h0IGdpdmVu
IGFsbCB0aGUgY29uc3RyYWludHMgaW4gdGhlClZGUyBhbmQgYmxvY2sgbGF5ZXIgY29kZSBwYXRo
cyBmb3IgdGhpcyB0cmFuc2l0aW9uIHRoYXQncyBnb2luZyBjb250cmFyeSB0bwp0aGUgdXN1YWwg
b3JkZXJpbmcgc2IgLT4gYmRldi4gQW5kIHllcyBJIGRvIHJlYWxpemUgYmNhY2hlZnMgZ3JhYnMg
c191bW91bnQKbm90IGJlY2F1c2UgaXQgaXRzZWxmIG5lZWRzIGl0IGJ1dCBiZWNhdXNlIGl0IGNh
bGxzIHNvbWUgVkZTIGhlbHBlcnMKKHN5bmNfZmlsZXN5c3RlbSgpKSB3aGljaCBleHBlY3QgaXQg
dG8gYmUgaGVsZCBzbyB0aGUgcGFpbiBpcyBpbmZsaWN0ZWQKYnkgVkZTIGhlcmUgYnV0IHRoYXQg
anVzdCBkZW1vc3RyYXRlcyB0aGUgZmFjdCB0aGF0IFZGUyBhbmQgRlMgbG9ja2luZyBhcmUKZGVl
cGx5IGludGVydHdpbmVkIGFuZCB5b3UgY2FuIGhhcmRseSBhdm9pZCBkZWFsaW5nIHdpdGggVkZT
IGxvY2tpbmcgcnVsZXMKaW4gdGhlIGZpbGVzeXN0ZW0gaXRzZWxmLgoKPiBJdCBhbHNvIGF2b2lk
cyB0aGUgcHJvYmxlbSBvZiAtPm1hcmtfZGVhZCBldmVudHMgYmVpbmcgZ2VuZXJhdGVkCj4gZnJv
bSBhIGNvbnRleHQgdGhhdCBob2xkcyBmaWxlc3lzdGVtL3ZmcyBsb2NrcyBhbmQgdGhlbiBkZWFk
bG9ja2luZwo+IHdhaXRpbmcgZm9yIHRob3NlIGxvY2tzIHRvIGJlIHJlbGVhc2VkLgo+IAo+IElP
V3MsIGEgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW0gc2hvdWxkIHJlYWxseSBiZSBpbXBsZW1lbnRp
bmcKPiAtPm1hcmtfZGVhZCBpdHNlbGYsIGFuZCBzaG91bGQgbm90IGJlIGRlcGVuZGluZyBvbiBi
ZWluZyBhYmxlIHRvCj4gbG9jayB0aGUgc3VwZXJibG9jayB0byB0YWtlIGFuIGFjdGl2ZSByZWZl
cmVuY2UgdG8gaXQuCj4gCj4gSXQgc2hvdWxkIGJlIHByZXR0eSBjbGVhciB0aGF0IHRoZXNlIGFy
ZSBub3QgaXNzdWVzIHRoYXQgdGhlIGdlbmVyaWMKPiBmaWxlc3lzdGVtIC0+bWFya19kZWFkIGlt
cGxlbWVudGF0aW9uIHNob3VsZCBiZSB0cnlpbmcgdG8KPiBoYW5kbGUuLi4uLgoKV2VsbCwgSU1P
IGV2ZXJ5IGZzIGltcGxlbWVudGF0aW9uIG5lZWRzIHRvIGRvIHRoZSBiZGV2IC0+IHNiIHRyYW5z
aXRpb24gYW5kCm1ha2Ugc2Igc29tZWhvdyBzdGFibGUuIEl0IG1heSBiZSB0aGF0IGdyYWJiaW5n
IHNfdW1vdW50IGFuZCBhY3RpdmUgc2IKcmVmZXJlbmNlIGlzIG5vdCB3aGF0IGV2ZXJ5Ym9keSB3
YW50cyBidXQgQUZBSVUgYnRyZnMgYXMgdGhlIHNlY29uZAptdWx0aS1kZXZpY2UgZmlsZXN5c3Rl
bSB3b3VsZCBiZSBmaW5lIHdpdGggdGhhdCBhbmQgZm9yIGJjYWNoZWZzIHRoaXMKZG9lc24ndCB3
b3JrIG9ubHkgYmVjYXVzZSB0aGV5IGhhdmUgc3BlY2lhbCBzdXBlcmJsb2NrIGluc3RhbnRpYXRp
b24KYmVoYXZpb3Igb24gbW91bnQgZm9yIGluZGVwZW5kZW50IHJlYXNvbnMgKGkuZS4sIG5vdCBi
ZWNhdXNlIGFjdGl2ZSByZWYKKyBzX3Vtb3VudCB3b3VsZCBiZSBwcm9ibGVtYXRpYyBmb3IgdGhl
bSkgaWYgSSB1bmRlcnN0YW5kIEtlbnQgcmlnaHQuClNvIEknbSBzdGlsbCBub3QgZnVsbHkgY29u
dmluY2VkIGVhY2ggbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW0gc2hvdWxkIGJlCnNoaXBwaW5nIHRo
ZWlyIHNwZWNpYWwgbWV0aG9kIHRvIGdldCBmcm9tIGRldmljZSB0byBzdGFibGUgc2IgcmVmZXJl
bmNlLgoKPiA+IFRoZSBzaHV0ZG93biBtZXRob2QgaXMgaW1wbGVtZW50ZWQgb25seSBieSBibG9j
ay1iYXNlZCBmaWxlc3lzdGVtcyBhbmQKPiA+IGFyZ3VhYmx5IHNodXRkb3duIHdhcyBhbHdheXMg
YSBtaXNub21lciBiZWNhdXNlIGl0IGFzc3VtZWQgdGhhdCB0aGUKPiA+IGZpbGVzeXN0ZW0gbmVl
ZHMgdG8gYWN0dWFsbHkgc2h1dCBkb3duIHdoZW4gaXQgaXMgY2FsbGVkLgo+IAo+IFNodXRkb3du
IHdhcyBub3QgLWFzc3VtZWQtIGFzIHRoZSBvcGVyYXRpb24gdGhhdCBuZWVkZWQgdG8gYmUKPiBw
ZXJmb3JtZWQuIFRoYXQgd2FzIHRoZSBmZWF0dXJlIHRoYXQgd2FzICpyZXF1aXJlZCogdG8gZml4
Cj4gZmlsZXN5c3RlbSBsZXZlbCBwcm9ibGVtcyB0aGF0IG9jY3VyIHdoZW4gdGhlIGRldmljZSB1
bmRlcm5lYXRoIGl0Cj4gZGlzYXBwZWFycy4KPiAKPiAtPm1hcmtfZGVhZCgpIGlzIHRoZSBhYnN0
cmFjdCBmaWxlc3lzdGVtIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBibG9jawo+IGRldmljZSwgZnNf
YmRmZXZfbWFya19kZWFkKCkgaXMgdGhlIC1nZW5lcmljIGltcGxlbWVudGF0aW9uLSBvZiB0aGUK
PiBmdW5jdGlvbmFsaXR5IHJlcXVpcmVkIGJ5IHNpbmdsZSBibG9jayBkZXZpY2UgZmlsZXN5c3Rl
bXMuIFBhcnQgb2YKPiB0aGF0IGZ1bmN0aW9uYWxpdHkgaXMgc2h1dHRpbmcgZG93biB0aGUgZmls
ZXN5c3RlbSBiZWNhdXNlIGl0IGNhbgo+ICpubyBsb25nZXIgZnVuY3Rpb24gd2l0aG91dCBhIGJh
Y2tpbmcgZGV2aWNlKi4KPiAKPiBtdWx0aS1ibG9jayBkZXZpY2UgZmlsZXN5c3RlbXMgcmVxdWly
ZSBjb21wZWx0ZWx5IGRpZmZlcmVudAo+IGltcGxlbWVudGF0aW9ucywgYW5kIHdlIGFscmVhZHkg
aGF2ZSBvbmUgdGhhdCAtZG9lcyBub3QgdXNlIGFjdGl2ZQo+IHN1cGVyYmxvY2sgcmVmZXJlbmNl
cy0uIElPV3MsIGV2ZW4gaWYgd2UgYWRkIC0+cmVtb3ZlX2JkZXYoc2IpCj4gY2FsbG91dCwgYmNh
Y2hlZnMgd2lsbCBjb250aW51ZSB0byB1c2UgLT5tYXJrX2RlYWQoKSBiZWNhdXNlIGxvdwo+IGxl
dmVsIGZpbGVzeXN0ZW0gZGV2aWNlIG1hbmFnZW1lbnQgaXNuJ3QgKGFuZCBzaG91bGRuJ3QgYmUh
KQo+IGRlcGVuZGVudCBvbiBoaWdoIGxldmVsIFZGUyBzdHJ1Y3R1cmUgcmVmZXJlbmNlIGNvdW50
aW5nLi4uLgoKSSBoYXZlIHRvIGFkbWl0IEkgZG9uJ3QgZ2V0IHdoeSBkZXZpY2UgbWFuYWdlbWVu
dCBzaG91bGRuJ3QgYmUgZGVwZW5kZW50IG9uClZGUyByZWZjb3VudHMgLyBsb2NraW5nLiBJTU8g
aXQgaXMgb2Z0ZW4gZGVwZW5kZW50IGFsdGhvdWdoIEkgYWdyZWUgd2l0aAptdWx0aXBsZSBkZXZp
Y2VzIHlvdSBsaWtlbHkgaGF2ZSB0byBkbyAqYWRkaXRpb25hbCogbG9ja2luZy4gQW5kIHllcywg
SSBjYW4KaW1hZ2luZSBWRlMgbG9ja2luZyBjb3VsZCBnZXQgaW4geW91ciB3YXkgYnV0IHRoZSBv
bmx5IHRhbmdpYmxlIGV4YW1wbGUgd2UKaGF2ZSBpcyBiY2FjaGVmcyBhbmQgYnRyZnMgc2VlbXMg
dG8gYmUgYSBjb3VudGVyIGV4YW1wbGUgc2hvd2luZyBldmVuIG11bHRpCmRldmljZSBmaWxlc3lz
dGVtIGNhbiBsaXZlIHdpdGggVkZTIGxvY2tpbmcuIFNvIEkgZG9uJ3QgdGhpbmsgdGhlIGNhc2Ug
aXMKYXMgY2xlYXIgYXMgeW91IHRyeSB0byBmcmFtZSBpdC4KClNvIGNvbmNlcHR1YWxseSBJIGFn
cmVlIG1ha2luZyBmaWxlc3lzdGVtcyBhcyBiZGV2IGhvbGRlcnMgaW1wbGVtZW50IHRoZWlyCm93
biBob2xkZXIgb3BzIG1ha2VzIGEgbG90IG9mIHNlbnNlIGJ1dCBiZWNhdXNlIG9mIGxvY2sgb3Jk
ZXJpbmcgcnVsZXMgaXQKaXMgbm90IHF1aXRlIHByYWN0aWNhbCBvciBlYXNpbHkgbWFpbnRhaW5h
YmxlIGNob2ljZSBJJ20gYWZyYWlkLgoKCQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tA
c3VzZS5jb20+ClNVU0UgTGFicywgQ1IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
