Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJkxB6h36WkBagIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 03:36:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4244C234
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 03:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzQ8VwG/uKyaApFjxjnSdb5hZjUvyEPo8W9qK9GluNI=; b=ZDWRiPW3R5ynuNb5vzimo2Nx6n
	rCxabNz0L0Bay7PHlbQRlfbKMtxdCJ1wQKjbzInPA4tPI15jdG7/7UnINnkAfV10h3DHxwAPb9FlN
	rZWlQGUSw0LiNUAYJtEo6bSJwm6crdrWv3m716oSxizu1kxH8Lv9cYtkrf5GXFEMgwg0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFizX-0003za-EY;
	Thu, 23 Apr 2026 01:36:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFizN-0003zN-Id
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 01:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qo7PBuq6BzRNudxbU+0q5/S2Icjjb7Fo/l5Z8KGwnMk=; b=Keu1/uzqhjZRBqiDyioy3hWWax
 ngMfTV2uXdWx4GOi7mwL9EjSDma4ThMngsNuB5sIyBAZiLJKhAg+z2OD8iba4A599DUgBVLbf9zAh
 uS/U0BeqM2Hbpit7Hk94tElw1LYnjzeChWffZx+qgeDlLzHGmza8uzZRulDIQ9puCCP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qo7PBuq6BzRNudxbU+0q5/S2Icjjb7Fo/l5Z8KGwnMk=; b=D8Tzp4zFbLGIaD7i3stVoWukAF
 AXUkdtly+L7WmZ5mOUpsBePKqxBElMqUke44SrnjdCcBSUu9luBpLL41fl9R/eOzwBE9VeuY4Pu0k
 I7wGh9bAJJhHGejc5BnXNBlA/GqGZ6ArkX+wyJixVXNrlioV+BlLK6vRTpxp6ko++K34=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFizN-0004Cb-4c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 01:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 924944451C;
 Thu, 23 Apr 2026 01:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0EEC2BCB4;
 Thu, 23 Apr 2026 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776908170;
 bh=fisfLRUPF2gQeK8/tjab1CMLN7z38y0h7QBe3fR1FGk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uLB/V9Vxth7g4vShFYvcL/mCTim0wfkAAkzRXOhJ3wDvANYCoRIde/8hvh+dG2QJF
 /jGC5YH+IR1TrhTJMzoW/ahCEIQqaIvTvOPOVyLT70ckze0ciCzKkRw9Ey6At5urbo
 OAy3FEXO7SjoCK+NI2hD22Uy6THb29cgHttSndmUTWS8jiMA17j06gmzCo/Nl+ikAq
 5rmJQKSDoXL0ZQ2hE/NnPbmXVr13Fg0WP7qJx/b11Odz6Jt4+TmF0qBMY7YVJk9X+w
 gqJHVlktyUP9gP84U0fdhV8hz9D1VlQczWS/xG/9G35iAySWuSucdKbee96dDB+uzs
 /XI/Yu8+CoQTw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 5F59AF4006A;
 Wed, 22 Apr 2026 21:36:08 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Wed, 22 Apr 2026 21:36:08 -0400
X-ME-Sender: <xms:iHfpaeo4VthmNtZ5zqVLjiXC2cn8tWHGEMdzLK0PkfHerQzKuwGL8w>
 <xme:iHfpaXdLH9MSdgJtkPwHUqYJVv1n_uNz8FaJj5-5PuPzSv6NNKdKbBoPzaTwYk9Lb
 c1xxpWMr8HwIBjxxcs-GZB4qopZ4Kv9XLZdh_pdji3Ur2a-_bOMJJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiheekgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdevhhhutghk
 ucfnvghvvghrfdcuoegtvghlsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
 epgffhgeeutdeiieevuefgvedtjeefudekvefggefguefgtefgledtteeuleelleetnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghhuhgtkh
 hlvghvvghrodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieefgeelleel
 heelqdefvdelkeeggedvfedqtggvlheppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrih
 hlrdgtohhmpdhnsggprhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepshgvnhhoiihhrghtshhkhiestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoh
 eprgguihhlghgvrhdrkhgvrhhnvghlseguihhlghgvrhdrtggrpdhrtghpthhtohepshhl
 rghvrgesughusggvhihkohdrtghomhdprhgtphhtthhopehrohhnnhhivghsrghhlhgsvg
 hrghesghhmrghilhdrtghomhdprhgtphhtthhopehsmhhfrhgvnhgthhesghhmrghilhdr
 tghomhdprhgtphhtthhopegrnhhnrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsg
 hrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptggvmheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheptghhrghosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:iHfpaR735JLTmlXf6PZaw09JvM2INK1_wFF6Sofysyc5cHAzrptIUA>
 <xmx:iHfpaR3Ct_L9JXA3_3D08tOGJwAeJitT7nP5_Yj2u3ZipmZ8_WhTyA>
 <xmx:iHfpacp_YaFAr7nSWwX0ZxI4Obx-0-j3X9gZ32hL5RJuIURnLf2EVg>
 <xmx:iHfpaXVoO2mIU-wKylIYQImIQNtl2kj4f7yCmO3vyFuPWUpTFhRI7w>
 <xmx:iHfpaRcA71LEAscdJdF6cGc-t3Q_4jPF-jb1PwNWd4SjcOeP35Uy-bpw>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 2894B780070; Wed, 22 Apr 2026 21:36:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 21:35:47 -0400
To: "Steve French" <smfrench@gmail.com>
Message-Id: <c41111fd-2473-4fdd-8e1e-285b9e24e631@app.fastmail.com>
In-Reply-To: <CAH2r5muvUVY8FD6ZM+ARecM8evjejB15n0Ea9Z=GGn=i5aKFNA@mail.gmail.com>
References: <20260422-case-sensitivity-v9-0-be023cc070e2@oracle.com>
 <20260422-case-sensitivity-v9-10-be023cc070e2@oracle.com>
 <CAH2r5muvUVY8FD6ZM+ARecM8evjejB15n0Ea9Z=GGn=i5aKFNA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 22, 2026, at 8:59 PM,
 Steve French wrote: > Acked-by:
 Steve French <stfrench@microsoft.com> > > Do you know which xfstests this
 would enable? IIRC a few of them > depend on the fs support [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFizN-0004Cb-4c
Subject: Re: [f2fs-dev] [PATCH v9 10/17] cifs: Implement fileattr_get for
 case sensitivity
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, Steve French <sfrench@samba.org>,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 frank.li@vivo.com, linux-nfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, Hans de Goede <hansg@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.00 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:smfrench@gmail.com,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2AF4244C234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIFdlZCwgQXByIDIyLCAyMDI2LCBhdCA4OjU5IFBNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6Cj4g
QWNrZWQtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KPgo+IERvIHlv
dSBrbm93IHdoaWNoIHhmc3Rlc3RzIHRoaXMgd291bGQgZW5hYmxlPyAgSUlSQyBhIGZldyBvZiB0
aGVtCj4gZGVwZW5kIG9uIHRoZSBmcyBzdXBwb3J0aW5nIGZpbGVhdHRyX2dldAoKVGhhbmtzIGZv
ciB0aGUgQWNrLgoKSSBjaGVja2VkIHRoZSBjdXJyZW50IHhmc3Rlc3RzIHRyZWUgYW5kIGNvdWxk
buKAmXQgZmluZCBhIHRlc3QgdGhhdCBmbGlwcwpmcm9tIG5vdHJ1biB0byBydW4gb24gY2lmcyBq
dXN0IGZyb20gYWRkaW5nIC0+ZmlsZWF0dHJfZ2V0LiBnZW5lcmljLzU1NgppcyB0aGUgZXhpc3Rp
bmcgY2FzZS1mb2xkaW5nIHRlc3QsIGJ1dCBfaGFzX2Nhc2Vmb2xkX2tlcm5lbF9zdXBwb3J0IGlu
CmNvbW1vbi9jYXNlZm9sZCBoYXJkLWNvZGVzIGV4dDQvZjJmcy90bXBmcy4gRW5hYmxpbmcgaXQg
b24gY2lmcyB3b3VsZApuZWVkIGEgbmV3IG1lY2hhbmlzbSBpbiBjb21tb24vY2FzZWZvbGQgcGx1
cyBhIG1vdW50LW9wdGlvbi1kcml2ZW4KdmFyaWFudCAodGhlIGNpZnMgcmVwb3J0aW5nIGtleXMg
b2ZmIG5vY2FzZSwgbm90IGEgcGVyLWlub2RlIGZsYWcpLCBzbwp0aGF0J3MgYSBzZXBhcmF0ZSBw
aWVjZSBvZiB3b3JrLgoKVGhlIHByYWN0aWNhbCBlZmZlY3Qgb24gdGhlIGV4aXN0aW5nIHN1aXRl
IGlzIHRoYXQgZnNzdHJlc3MncyBnZXRhdHRyX2YKbm93IHJldHVybnMgc3VjY2VzcyBpbnN0ZWFk
IG9mIEVOT1RUWSBvbiBjaWZzLCB3aGljaCBxdWlldHMgc29tZSBub2lzZQpidXQgZG9lc24ndCBn
YXRlIGFueSB0ZXN0LiBUbyBhY3R1YWxseSBleGVyY2lzZSB0aGUgbmV3IEZTX1hGTEFHX0NBU0VG
T0xECnJlcG9ydGluZyBJIHRoaW5rIGEgbmV3IHRlc3QgKG9yIGEgZ2VuZXJhbGl6YXRpb24gb2Yg
Z2VuZXJpYy81NTYpIHdvdWxkCmhhdmUgdG8gYmUgd3JpdHRlbi4KCgotLSAKQ2h1Y2sgTGV2ZXIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
