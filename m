Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD7B0C13E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 12:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGFHU9pZkMsvFJbyTy/7AcnBYqOqo77hq4ySRigjDbQ=; b=Y2xKVFxA0PSvBzykiG8bhRWLxW
	x26SnNKphHmrXPdLiU1loI3mts9vIDEbWibQCpT6XYAUD4bsdK875fVWK271vZLbq62791OiZ/wRd
	vcmTluziDcsCT5oaWaIFofa/jOWkDKnOBSFvIHrkZiujiMOPxryRzaQw5O78gCP21l+c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udnil-0006Bk-2Q;
	Mon, 21 Jul 2025 10:26:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1udnij-0006BS-AQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 10:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=; b=i+COTKDqeLS6xeDIJ5lCg+1cbY
 eyCvCGLt2e2U67ZP/c6v6uS2z55r2TGGY/yhK/EF4EUA+k47U61MsR8+mNlpiYU/V5EdYiRC+RARN
 CLb3HVv2kklckx7tqZ9oupCZFjwElmdJA7JsDcYzbHtj0ji2jRx9XoWzJEKajoMotp+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=; b=Z1SKU8Az1LHgM6xWc4M9FcULLU
 Od6bbqW7k41Cp9QECIOEhY/9SZLK7iKeh3hzs9XZxnCrcZrBtv1uVGBAvbCFoVTKXBzqNCpLBsfRP
 PNkGzdz0fJQBiKZv0mTzWZCLjbYtF8cofoIHlKwZiWWU7XJjOb1ebtwIrYTsPO1Y/3AA=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1udnih-0005xg-A3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 10:26:09 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51A1E1F397;
 Mon, 21 Jul 2025 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753093555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
 b=GGCpmZZgbAB5XlOhPaT/l0zeSwhiqSn6JbNbcSAdSIrsIWr7T0Mc7Nurq9TLL5MlDIKSzb
 G3mxxnF5X/WFL2F9PDn8NfEprPokB+uugrjkHFG+jVRlyIUBsFn+89vrEh51dQKAspuIIa
 bOQxVSvP+dassyYss7hQFywZfgAWP9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753093555;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
 b=TiuaNzkKooiGvnBZgx/DGGdlv5vk/tkXPxkZgwh1y7czyZp1RZa8jl8Z3vpXSlkZ0+KbS8
 LZDo/WglGtJ31cBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=GGCpmZZg;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=TiuaNzkK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753093555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
 b=GGCpmZZgbAB5XlOhPaT/l0zeSwhiqSn6JbNbcSAdSIrsIWr7T0Mc7Nurq9TLL5MlDIKSzb
 G3mxxnF5X/WFL2F9PDn8NfEprPokB+uugrjkHFG+jVRlyIUBsFn+89vrEh51dQKAspuIIa
 bOQxVSvP+dassyYss7hQFywZfgAWP9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753093555;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
 b=TiuaNzkKooiGvnBZgx/DGGdlv5vk/tkXPxkZgwh1y7czyZp1RZa8jl8Z3vpXSlkZ0+KbS8
 LZDo/WglGtJ31cBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3453C13A88;
 Mon, 21 Jul 2025 10:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Lyt7DLMVfmi/GgAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 21 Jul 2025 10:25:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 5D047A0884; Mon, 21 Jul 2025 12:25:54 +0200 (CEST)
Date: Mon, 21 Jul 2025 12:25:54 +0200
From: Jan Kara <jack@suse.cz>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Message-ID: <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 51A1E1F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[28];
 RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.com]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL76kpr34nasjgd69zbi7paxtw)];
 MISSING_XM_UA(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,infradead.org,fb.com,toxicpanda.com,suse.com,vger.kernel.org,fluxnic.net,kernel.org,lists.ozlabs.org,lists.sourceforge.net,suse.cz,nod.at,lists.infradead.org,redhat.com,lists.linux.dev,manguebit.org,paragon-software.com,samba.org,squashfs.org.uk,oppo.com,gmx.com];
 DKIM_TRACE(0.00)[suse.cz:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.com:email]
X-Spam-Score: -4.01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 21-07-25 11:14:02, Gao Xiang wrote: > Hi Barry, > >
 On 2025/7/21 09:02, Barry Song wrote: > > On Wed, Jul 16, 2025 at 8:28 AM
 Gao Xiang <hsiangkao@linux.alibaba.com> wrote: > > > > > ... > > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1udnih-0005xg-A3
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-cifs@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Howells <dhowells@redhat.com>, Nicolas Pitre <nico@fluxnic.net>,
 David Woodhouse <dwmw2@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Hailong Liu <hailong.liu@oppo.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uIDIxLTA3LTI1IDExOjE0OjAyLCBHYW8gWGlhbmcgd3JvdGU6Cj4gSGkgQmFycnksCj4g
Cj4gT24gMjAyNS83LzIxIDA5OjAyLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwg
MTYsIDIwMjUgYXQgODoyOOKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEu
Y29tPiB3cm90ZToKPiA+ID4gCj4gCj4gLi4uCj4gCj4gPiA+IAo+ID4gPiAuLi4gaGlnaC1vcmRl
ciBmb2xpb3MgY2FuIGNhdXNlIHNpZGUgZWZmZWN0cyBvbiBlbWJlZGRlZCBkZXZpY2VzCj4gPiA+
IGxpa2Ugcm91dGVycyBhbmQgSW9UIGRldmljZXMsIHdoaWNoIHN0aWxsIGhhdmUgTWlCcyBvZiBt
ZW1vcnkgKGFuZCBJCj4gPiA+IGJlbGlldmUgdGhpcyB3b24ndCBjaGFuZ2UgZHVlIHRvIHRoZWly
IHVzZSBjYXNlcykgYnV0IHRoZXkgYWxzbyB1c2UKPiA+ID4gTGludXgga2VybmVsIGZvciBxdWl0
ZSBsb25nIHRpbWUuICBJbiBzaG9ydCwgSSBkb24ndCB0aGluayBlbmFibGluZwo+ID4gPiBsYXJn
ZSBmb2xpb3MgZm9yIHRob3NlIGRldmljZXMgaXMgdmVyeSB1c2VmdWwsIGxldCBhbG9uZSBsaW1p
dGluZwo+ID4gPiB0aGUgbWluaW11bSBmb2xpbyBvcmRlciBmb3IgdGhlbSAoSXQgd291bGQgbWFr
ZSB0aGUgZmlsZXN5c3RlbSBub3QKPiA+ID4gc3VpdGFibGUgYW55IG1vcmUgZm9yIHRob3NlIHVz
ZXJzLiAgQXQgbGVhc3QgdGhhdCBpcyB3aGF0IEkgbmV2ZXIKPiA+ID4gd2FudCB0byBkbykuICBB
bmQgSSBiZWxpZXZlIHRoaXMgaXMgZGlmZmVyZW50IGZyb20gdGhlIGN1cnJlbnQgTEJTCj4gPiA+
IHN1cHBvcnQgdG8gbWF0Y2ggaGFyZHdhcmUgY2hhcmFjdGVyaXN0aWNzIG9yIExCUyBhdG9taWMg
d3JpdGUKPiA+ID4gcmVxdWlyZW1lbnQuCj4gPiAKPiA+IEdpdmVuIHRoZSBkaWZmaWN1bHR5IG9m
IGFsbG9jYXRpbmcgbGFyZ2UgZm9saW9zLCBpdCdzIGFsd2F5cyBhIGdvb2QKPiA+IGlkZWEgdG8g
aGF2ZSBvcmRlci0wIGFzIGEgZmFsbGJhY2suIFdoaWxlIEkgYWdyZWUgd2l0aCB5b3VyIHBvaW50
LAo+ID4gSSBoYXZlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHBlcnNwZWN0aXZlIOKAlCBlbmFibGlu
ZyBsYXJnZSBmb2xpb3MgZm9yCj4gPiB0aG9zZSBkZXZpY2VzIG1pZ2h0IGJlIGJlbmVmaWNpYWws
IGJ1dCB0aGUgbWF4aW11bSBvcmRlciBzaG91bGQKPiA+IHJlbWFpbiBzbWFsbC4gSSdtIHJlZmVy
cmluZyB0byAic21hbGwiIGxhcmdlIGZvbGlvcy4KPiAKPiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBh
IHdheSB0byBsaW1pdCB0aGUgbWF4aW11bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKPiBkZXZpY2Vz
IChyYXRoZXIgdGhhbiBkaXNhYmxpbmcgaXQgY29tcGxldGVseSkgd291bGQgYmUgaGVscGZ1bC4g
IEF0Cj4gbGVhc3QgInNtYWxsIiBsYXJnZSBmb2xpb3MgY291bGQgc3RpbGwgcHJvdmlkZSBiZW5l
Zml0cyB3aGVuIG1lbW9yeQo+IHByZXNzdXJlIGlzIGxpZ2h0LgoKV2VsbCwgaW4gdGhlIHBhZ2Ug
Y2FjaGUgeW91IGNhbiB0dW5lIG5vdCBvbmx5IHRoZSBtaW5pbXVtIGJ1dCBhbHNvIHRoZQptYXhp
bXVtIG9yZGVyIG9mIGEgZm9saW8gYmVpbmcgYWxsb2NhdGVkIGZvciBlYWNoIGlub2RlLiBCdHJm
cyBhbmQgZXh0NAphbHJlYWR5IHVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkuIFNvIGluIHByaW5jaXBs
ZSB0aGUgZnVuY3Rpb25hbGl0eSBpcyB0aGVyZSwKaXQgaXMgImp1c3QiIGEgcXVlc3Rpb24gb2Yg
cHJvcGVyIHVzZXIgaW50ZXJmYWNlcyBvciBhdXRvbWF0aWMgbG9naWMgdG8KdHVuZSB0aGlzIGxp
bWl0LgoKCQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFi
cywgQ1IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
