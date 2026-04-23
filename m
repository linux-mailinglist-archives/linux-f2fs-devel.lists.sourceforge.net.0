Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMlMFihv6WkzZgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 03:00:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142644BFC4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 03:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjvf1jZnCw0TMIKXY5ou7tZl+Q0ZWsfKKOOiYRwb0i4=; b=eKOi/5a73pEhOKtzsgxo66ZWPp
	7GdFOrqhpkF7W0Ui9iI7/9F/4OR0MSX3PwHwjVRsbmo4tkRCNghm83wcZhR8dP5izWa7u6g416J0W
	RrnyUL11P1IfQnmkeolVa2vhjgOL67eEdTZHpIJX2liD9KrKLypPA1Uld8CpvAj7dKhY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFiQQ-0000kP-7x;
	Thu, 23 Apr 2026 01:00:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <smfrench@gmail.com>) id 1wFiQO-0000kI-IS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 01:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/Auuo3ewU9oR2gX8cwKFh7CPK/qOcoVmyN6PErL6wA=; b=Xc+s+YtL3l4QMHsy1V/EI0ljKd
 zDp1fEvSEg8p4LR2Ot1KA6y0hoM97pnCuOri9Rv0MSewViJjwILBQFaWFxCuKHrJQU8J0qKL6y/aO
 56FHvDvJ2Va4VciYwWcGhp6Ey/2gUbiLVwEq5Z6Ag9cADFmE2INeeRwHvODpbtZomWck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t/Auuo3ewU9oR2gX8cwKFh7CPK/qOcoVmyN6PErL6wA=; b=XkIk7b+i0mvAqeJvZIRa8xmP2B
 FCx/CAQBp4jIOVU7bOjp9KhSQBG1pSOttmheikC6KFfYUdN6y+d2hXpYjemZ5tLsnqZIT2UIKJS6Y
 p6BrjYg7HaCnbv/m2e2z6FlyKhR3nXZntP4YV07V4VWysy4YIzwKyeYYAHkOSG/Pjfo0=;
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wFiQK-0002IJ-IK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 01:00:10 +0000
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8ee7ffd738dso243490285a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Apr 2026 18:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776905997; cv=none;
 d=google.com; s=arc-20240605;
 b=CFokLl6e8nXXah3xZ6J3xKM2AHd3qQRuUwXeWuFYlmpN46UTcS4E4Me8kXmEpHBBbY
 5CfyWUhD7iq/X/RjVEdZUit7MkKWxMjxtcVohxySimZhumbD/q7154u2nEzZFirq40bB
 0A7bsdNL2qKEXoPpMMeAocgHvAjLqg3jsaa5SKCiTKOjNHhVEZixu1hOORMLV/z3JuHr
 w9Y5bXMxO6s4VU6ZbTaZEgaVJouVAE0uQ8K1haHXxoiQGvRrPDMfdHbYFvEOBL9JkvPI
 H0p+gQVpJbOf6QYc4gNF/MnqhbLVFi4lSddors+GXdqJrUrJ9sQ032Sir0bkhzE2IvNT
 Q6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=t/Auuo3ewU9oR2gX8cwKFh7CPK/qOcoVmyN6PErL6wA=;
 fh=p+WSO/liWedrjrHwoDbSPaZWdlXZbNyjQci8dExGMAQ=;
 b=eAgQy86oEO5ZIxcO6Bf3yp4sEXuIziBKPVBYdWS/cj+wkyRjpy4/4h1qrewUwuOJgI
 4X4pdBaM/mbzb2WbZPYh0CidcLcUcMKpmkYtLVIU0BSyV1ueqa0lZhie+mDMQNQOm3Xg
 2WtnSCNcbQMiwhu4hmkMtlFFpMfH08NGBtkddZ56WpzV6wjUVSzmvjek2xRClPwx+NGa
 iUgj4gun6R8uKE9rGDgHszsuJdNO6Ank8RJHhyAug1snMWGUPVaJVK5nF/Wcm83GpEDo
 fDpO4vuOAnCoh+/u/LVUAG17P9gXfv4QFc6cVlP9vPtXGlBW+RFWiNm6crfxqHCK792I
 WJeQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776905997; x=1777510797; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/Auuo3ewU9oR2gX8cwKFh7CPK/qOcoVmyN6PErL6wA=;
 b=Hc/eahHoFYIv20ZrOilrrW+acNybKB/UzTxb+GCUUQ7wI9Ic0jnkFUcZbv1aeWrnRy
 0ISjG31rfMLpbPL8AqGt7crjoSIL0Yj/W5eTb6TPs/yP/wHSBKsuZjOYS8P5A+TueWZq
 pnIGoritOfktoMBMR0VLFisd6rslQdn5yNWXFE6S8vSmSzngRGH8+3mw5eXlRt1TqLAq
 kYrMxw3WWvCPYEwdtmxSK30lT0HUsbkpfB/vqqy05HKR9oDUuAK7vmxIZCHSjvSI4G6D
 NFE9QRDpUBKz2ndop95e8i1NqVHvVCAcbEWEhFdFEs4lVcmWDPQRgb957YnTP9jDeO65
 RdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776905997; x=1777510797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t/Auuo3ewU9oR2gX8cwKFh7CPK/qOcoVmyN6PErL6wA=;
 b=FdiIEhmjaVtuyUf7QTfAZdTHkMrLeOUzobiCUuoT8yLl3/XL1N6SiiBIT5SQAZohIY
 ly3g87b7fhKOkAzGcZeKk4IBAXoLXTiVelpFGQx93+XKKxMDU2iKr+RRDhJG/3Fkq2ti
 iFakWP3KCA9+pqDwb+sWIdxGRyOiauPJeMVUumRPlhmhCFEuwP2iplZvve2lgGK7zY05
 ehyKAlZ6roqkwDPQHGsOM4MEsDIHJj9dGTBK180Zbnl301dtg/1QIt3x2oKl2jjW+/o9
 Hwcvdz4PBzDzKZoYD2RrU5DbZgujuvcDQXS3xopCNCaIqmDQdxPN7XqvRnoLERaYAE4W
 ZjzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ//uksPYVb93gg9opnLWB3I+mlad9Y/dUkG/l2naY1nvRcfInxsPHJ3Dr4+SOMj7WOPk8QncFY5J1vWqg1D6ZrK@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzGtxo75pXrqyFPjWarz6EqAHLT4paU+TNwJPmIE5Nal0l7pMiM
 K2SCoA+/gCzAlRmb/7tDel/5nBmacZ+531NMwP7KmhlKJxEX5nJ5fVKDFNjDrdvaIWqqEE5Pxmt
 Lb78x1HSWnbfwdHCTTsvMfDkOLptc1Hs=
X-Gm-Gg: AeBDietbc9tGs72TvtuO8v2i70MMn0DJeZ1zLzLQLEHjN8PPs56tLhmb5rRokiSSEps
 bFuvi9jckKAe5i/vsCBOBuCYkWDyXQlh5a3b5X/xgoE5Ao3HG9u6xDPhrZkJm2FiuldRiAU79mb
 e9CfJ29yT4bnPDpd0GWTxX9a3VxGOIYLEloSppUFiL/OmjkEbpwSLhMeklbpZ3UddHao8dRcUZf
 MiCOPQ7RuggImqWAwlORpZAf3s0NMXDWG9hKWoGscWcAJOV9X47enbX8G8MVfAIyphfy9DlX6oy
 qZDGJhQja7cvbVgO0iFhp9nTvVP8DaNtAuwkVzL8MJYAe/al8P05CaFlcWxpVub2gU8wKl3xqnD
 1ZHVp4ENMk8feeFyXRH8i7Xux+C7azTLd0B8V71YGtomkjPdGfsRYF/YPTt64eU8CLYyxl/4tKz
 s12/xwhkJfnpPCLXP2IDseghdLHElFEGUGFP9ga1AzT9A=
X-Received: by 2002:a05:6214:490a:b0:8ac:b3ba:eb0c with SMTP id
 6a1803df08f44-8b0282f35c0mr336785626d6.2.1776905997499; Wed, 22 Apr 2026
 17:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260422-case-sensitivity-v9-0-be023cc070e2@oracle.com>
 <20260422-case-sensitivity-v9-10-be023cc070e2@oracle.com>
In-Reply-To: <20260422-case-sensitivity-v9-10-be023cc070e2@oracle.com>
From: Steve French <smfrench@gmail.com>
Date: Wed, 22 Apr 2026 19:59:43 -0500
X-Gm-Features: AQROBzCtyORnfuVHnIm1n6WO0qai8y2HQyRw138-ozkefgToPmyDNAGdDckhKog
Message-ID: <CAH2r5muvUVY8FD6ZM+ARecM8evjejB15n0Ea9Z=GGn=i5aKFNA@mail.gmail.com>
To: Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Acked-by: Steve French Do you know which xfstests this would
 enable? IIRC a few of them depend on the fs supporting fileattr_get On Wed,
 Apr 22, 2026 at 6:34 PM Chuck Lever wrote: > > From: Chuck Lever > > Upper
 layers such as NFSD need a way to query whether a filesystem > handles
 filenames in a case-sensitive manner. Repo [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [smfrench(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.174 listed in wl.mailspike.net]
X-Headers-End: 1wFiQK-0002IJ-IK
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
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 sprasad@microsoft.com, frank.li@vivo.com, linux-nfs@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[smfrench@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smfrench@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9142644BFC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QWNrZWQtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KCkRvIHlvdSBr
bm93IHdoaWNoIHhmc3Rlc3RzIHRoaXMgd291bGQgZW5hYmxlPyAgSUlSQyBhIGZldyBvZiB0aGVt
CmRlcGVuZCBvbiB0aGUgZnMgc3VwcG9ydGluZyBmaWxlYXR0cl9nZXQKCk9uIFdlZCwgQXByIDIy
LCAyMDI2IGF0IDY6MzTigK9QTSBDaHVjayBMZXZlciA8Y2VsQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogQ2h1Y2sgTGV2ZXIgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+Cj4KPiBVcHBlciBs
YXllcnMgc3VjaCBhcyBORlNEIG5lZWQgYSB3YXkgdG8gcXVlcnkgd2hldGhlciBhIGZpbGVzeXN0
ZW0KPiBoYW5kbGVzIGZpbGVuYW1lcyBpbiBhIGNhc2Utc2Vuc2l0aXZlIG1hbm5lci4gUmVwb3J0
IENJRlMvU01CIGNhc2UKPiBoYW5kbGluZyBiZWhhdmlvciB2aWEgdGhlIEZTX1hGTEFHX0NBU0VG
T0xEIGZsYWcuCj4KPiBDSUZTIHNlcnZlcnMgKHR5cGljYWxseSBXaW5kb3dzIG9yIFNhbWJhKSBh
cmUgdXN1YWxseSBjYXNlLWluc2Vuc2l0aXZlCj4gYnV0IGNhc2UtcHJlc2VydmluZywgbWVhbmlu
ZyB0aGV5IGlnbm9yZSBjYXNlIGR1cmluZyBsb29rdXBzIGJ1dCBzdG9yZQo+IGZpbGVuYW1lcyBl
eGFjdGx5IGFzIHByb3ZpZGVkLgo+Cj4gVGhlIGltcGxlbWVudGF0aW9uIHJlcG9ydHMgY2FzZSBz
ZW5zaXRpdml0eSBiYXNlZCBvbiB0aGUgbm9jYXNlIG1vdW50Cj4gb3B0aW9uLCB3aGljaCByZWZs
ZWN0cyB3aGV0aGVyIHRoZSBjbGllbnQgZXhwZWN0cyB0aGUgc2VydmVyIHRvIHBlcmZvcm0KPiBj
YXNlLWluc2Vuc2l0aXZlIGNvbXBhcmlzb25zLiBXaGVuIG5vY2FzZSBpcyBzZXQsIHRoZSBtb3Vu
dCBpcyByZXBvcnRlZAo+IGFzIGNhc2UtaW5zZW5zaXRpdmUuCj4KPiBUaGUgY2FsbGJhY2sgaXMg
cmVnaXN0ZXJlZCBpbiBhbGwgdGhyZWUgaW5vZGVfb3BlcmF0aW9ucyBzdHJ1Y3R1cmVzCj4gKGRp
cmVjdG9yeSwgZmlsZSwgYW5kIHN5bWxpbmspIHRvIGVuc3VyZSBjb25zaXN0ZW50IHJlcG9ydGlu
ZyBhY3Jvc3MKPiBhbGwgaW5vZGUgdHlwZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVjayBMZXZl
ciA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4KPiAtLS0KPiAgZnMvc21iL2NsaWVudC9jaWZzZnMu
YyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jaWZzZnMuYyBiL2ZzL3NtYi9j
bGllbnQvY2lmc2ZzLmMKPiBpbmRleCAyMDI1NzM5ZjA3MGEuLjliNzBmZmEzZTAxZCAxMDA2NDQK
PiAtLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNmcy5jCj4gKysrIGIvZnMvc21iL2NsaWVudC9jaWZz
ZnMuYwo+IEBAIC0zMCw2ICszMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC94YXR0ci5oPgo+ICAj
aW5jbHVkZSA8bGludXgvbW0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tleS10eXBlLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9maWxlYXR0ci5oPgo+ICAjaW5jbHVkZSA8dWFwaS9saW51eC9tYWdpYy5o
Pgo+ICAjaW5jbHVkZSA8bmV0L2lwdjYuaD4KPiAgI2luY2x1ZGUgImNpZnNmcy5oIgo+IEBAIC0x
MTk5LDYgKzEyMDAsMjIgQEAgc3RydWN0IGZpbGVfc3lzdGVtX3R5cGUgc21iM19mc190eXBlID0g
ewo+ICBNT0RVTEVfQUxJQVNfRlMoInNtYjMiKTsKPiAgTU9EVUxFX0FMSUFTKCJzbWIzIik7Cj4K
PiArc3RhdGljIGludCBjaWZzX2ZpbGVhdHRyX2dldChzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIHN0
cnVjdCBmaWxlX2thdHRyICpmYSkKPiArewo+ICsgICAgICAgc3RydWN0IGNpZnNfc2JfaW5mbyAq
Y2lmc19zYiA9IENJRlNfU0IoZGVudHJ5LT5kX3NiKTsKPiArICAgICAgIHN0cnVjdCBjaWZzX3Rj
b24gKnRjb24gPSBjaWZzX3NiX21hc3Rlcl90Y29uKGNpZnNfc2IpOwo+ICsKPiArICAgICAgIC8q
Cj4gKyAgICAgICAgKiBUaGUgbm9jYXNlIG1vdW50IG9wdGlvbiBpbnN0YWxscyBjYXNlLWluc2Vu
c2l0aXZlIGRlbnRyeQo+ICsgICAgICAgICogb3BlcmF0aW9ucyBvbiB0aGlzIHN1cGVyYmxvY2su
IFNNQiBwcmVzZXJ2ZXMgY2FzZSBvbiB0aGUKPiArICAgICAgICAqIHdpcmUgYW5kIGF0IHJlc3Qs
IHNvIHRoZSBtb3VudCBtYXRjaGVzIEZTX1hGTEFHX0NBU0VGT0xECj4gKyAgICAgICAgKiBzZW1h
bnRpY3M6IGNhc2UtZm9sZGVkIGxvb2t1cCwgdmVyYmF0aW0gc3RvcmFnZS4KPiArICAgICAgICAq
Lwo+ICsgICAgICAgaWYgKHRjb24tPm5vY2FzZSkKPiArICAgICAgICAgICAgICAgZmEtPmZzeF94
ZmxhZ3MgfD0gRlNfWEZMQUdfQ0FTRUZPTEQ7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsK
PiAgY29uc3Qgc3RydWN0IGlub2RlX29wZXJhdGlvbnMgY2lmc19kaXJfaW5vZGVfb3BzID0gewo+
ICAgICAgICAgLmNyZWF0ZSA9IGNpZnNfY3JlYXRlLAo+ICAgICAgICAgLmF0b21pY19vcGVuID0g
Y2lmc19hdG9taWNfb3BlbiwKPiBAQCAtMTIxNyw2ICsxMjM0LDcgQEAgY29uc3Qgc3RydWN0IGlu
b2RlX29wZXJhdGlvbnMgY2lmc19kaXJfaW5vZGVfb3BzID0gewo+ICAgICAgICAgLmxpc3R4YXR0
ciA9IGNpZnNfbGlzdHhhdHRyLAo+ICAgICAgICAgLmdldF9hY2wgPSBjaWZzX2dldF9hY2wsCj4g
ICAgICAgICAuc2V0X2FjbCA9IGNpZnNfc2V0X2FjbCwKPiArICAgICAgIC5maWxlYXR0cl9nZXQg
PSBjaWZzX2ZpbGVhdHRyX2dldCwKPiAgfTsKPgo+ICBjb25zdCBzdHJ1Y3QgaW5vZGVfb3BlcmF0
aW9ucyBjaWZzX2ZpbGVfaW5vZGVfb3BzID0gewo+IEBAIC0xMjI3LDYgKzEyNDUsNyBAQCBjb25z
dCBzdHJ1Y3QgaW5vZGVfb3BlcmF0aW9ucyBjaWZzX2ZpbGVfaW5vZGVfb3BzID0gewo+ICAgICAg
ICAgLmZpZW1hcCA9IGNpZnNfZmllbWFwLAo+ICAgICAgICAgLmdldF9hY2wgPSBjaWZzX2dldF9h
Y2wsCj4gICAgICAgICAuc2V0X2FjbCA9IGNpZnNfc2V0X2FjbCwKPiArICAgICAgIC5maWxlYXR0
cl9nZXQgPSBjaWZzX2ZpbGVhdHRyX2dldCwKPiAgfTsKPgo+ICBjb25zdCBjaGFyICpjaWZzX2dl
dF9saW5rKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwgc3RydWN0IGlub2RlICppbm9kZSwKPiBAQCAt
MTI2MSw2ICsxMjgwLDcgQEAgY29uc3Qgc3RydWN0IGlub2RlX29wZXJhdGlvbnMgY2lmc19zeW1s
aW5rX2lub2RlX29wcyA9IHsKPiAgICAgICAgIC5zZXRhdHRyID0gY2lmc19zZXRhdHRyLAo+ICAg
ICAgICAgLnBlcm1pc3Npb24gPSBjaWZzX3Blcm1pc3Npb24sCj4gICAgICAgICAubGlzdHhhdHRy
ID0gY2lmc19saXN0eGF0dHIsCj4gKyAgICAgICAuZmlsZWF0dHJfZ2V0ID0gY2lmc19maWxlYXR0
cl9nZXQsCj4gIH07Cj4KPiAgLyoKPgo+IC0tCj4gMi41My4wCj4KPgoKCi0tIApUaGFua3MsCgpT
dGV2ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
