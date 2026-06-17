Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BxEENUMMMmoquAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 04:53:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83F696312
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 04:53:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XoJyQIaw;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=c5ABze23;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=SdDgrT+c;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=oGaMzVri;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aBYQcacYkrVYgw/eKxOYdbL8UbQpXCxEx5K4HkQYtE=; b=XoJyQIaw6PxqXgL2nB60RKsC8f
	JSXDFCDxXIvIQpLo7RfTQbdOFrfXicPBK6+VMmtD3F7KSHBq7JhZn1gfbQk+ccj33MpH+HBmWnAMM
	LF9356OYWndcVnk1Zmnu5MiNfK7omDVTx29S/pfyanogBgqr7+SyJYdPzMTlaKfD+Sn0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZgPP-0005Ln-6M;
	Wed, 17 Jun 2026 02:53:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1wZgPN-0005Le-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 02:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YvS5HLgHq2zSqaglFmPlAVWIHVwd+WllGgZP1tWAAb4=; b=c5ABze23JcO8CKqMnir1NeLKZT
 v+OFDFgA0SqKQBib2/EtS23LYcxoK1tdNG7K6CDINcGpPg6zlx4BRiiCjRBwm7E9fKIwIPdu45rZ4
 kcgEweFV6EWHukJfYbexGjDxNpw5kfTWRdP1nwuNCQtBKussQkO0dZZQdOs73caECxJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YvS5HLgHq2zSqaglFmPlAVWIHVwd+WllGgZP1tWAAb4=; b=SdDgrT+c7d/m0nDjPBUdrvF7sr
 Qqt30+UGq53NQJl9N/v0bnpcGFIbIKs4n70kgJAC0cZ2QxVYl7H/oNWon+bz6ngPkjy8LITbNP4Aw
 IwW34UsLkFTH+ElLmspE8XB9oohpWdgZobPJSdMJg3zBb6NgaB3PUMvlknBgBTKfIjDc=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZgPM-0004c9-QA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 02:53:41 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-45ee224f5fdso469128f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 19:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781664810; cv=none;
 d=google.com; s=arc-20240605;
 b=U3QTlP0bxVvz1WQ/fmKfySGMKLWa3xdW/Kuarof+1G+Tkme/Y7XhK8bmDL5VUamNIC
 TWSDspQpUzfjtwnyJkKQUDkluLavEYEvlSxzu8wUXXJp9AD8CxHkMIsc/OREFKpn5Sk3
 ujakEomx20vua/Vjkm6JcjCm8l9asSE92HQvquZwSjJZvbQxJCvWomrrkzsXWYu435uX
 VK6yFkVqNPZ18mtL1DHf8w8SccjZGvukdXrMSDeDkDVGwlzqrUG3S+un+XzNfKskfbp1
 rBTDyY/ZJpuGPNGwtJiHLMsuX1MgqKHaVnnwUNA94PAwkKM62aA/+xpoZX69tagJwNTZ
 lLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YvS5HLgHq2zSqaglFmPlAVWIHVwd+WllGgZP1tWAAb4=;
 fh=LAHX4kwIkDVGMHPEOIdebtAfjIO03zrYlO8VCv19jOg=;
 b=GIaYWFr09faRJ/7t0F7eSrkl6eeqKh3LfcsOEqc8VInXWJmtjBCWtlBO4U5V6L8KR8
 BpDs20KAYo4bAJY/HHtq416rtCICHsG3YdwK4JhTHgHlPOmIjgNv3WBs7hctjzBUF3D+
 61wRUun2zwK6QwuG8kBrJwcZLnboQXD1Ryh5NNLsouVRntvEokoyMNCJqr5JEA02t5he
 wih9WWWqbwbx9C9EmaP8c5D0thNwvmZRuT1IkDpmUIvhbHzj4vrV3sd3LhtqfZMGvJP5
 AHuwyJD+wXnl9dPYPkvF+jmNp0B+GrN42+D+YUjjYv+AG86uvB+u7xCMctTZklSQuf6l
 duMw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781664810; x=1782269610; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvS5HLgHq2zSqaglFmPlAVWIHVwd+WllGgZP1tWAAb4=;
 b=oGaMzVriaXrN8aK6moOngMWK9KJ1Re10PIz0jTku81kFPlkoRj50nrnWFknJJ6ynff
 V/Ea2Rny9uMjWJbSfD3+5aEtxeLAdO9sOGzxeiUe8w4mjDPzIVmrq2Szqy+qAh1zIrp9
 PmydxTk+WSypoM2F+WGZtfUvLplMXserE56+VgSx7oPjg/JH9yeWIK0frd8UAFVt1+bA
 uazR9oEGyhdw76ojkgR8pNS0AXr+2Z6EbfXedqyG7IoL4scLGGAo13EO6k91fYdNhVzB
 vxfm+UWEjXWP5y2P4N/chPw4KJ4+P44oF8mfi+TF1YezdTaljcKFz0m4Ify3knueOSlC
 knqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781664810; x=1782269610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YvS5HLgHq2zSqaglFmPlAVWIHVwd+WllGgZP1tWAAb4=;
 b=U3BVtnwwy1DSq0AMPRubeamZTe65aPe91o1k6T3LoNxBI9BP3HOBFcsnzZF1QjRJXi
 Nxg8bR55ipuwMBP/C+qcNX7knJok59kqc2/5BP77wfzqYBuv1F06cest7KZtyp9VlVbI
 aAcUb6QoiT76qbnqW3MWIz9TPFOysyTLcEXcMFV+0K2dmZ6Gtw+xM27JJdcz11dl0QGc
 dFAkhDFlB7y3W2UXtmq4bHmXBMHj67Cn970d+E3ib0BUWNaUdpHtl0sUsLsipYUkzJiZ
 0NEO95tLGRhhGiYiuvQh4QNPB5EHw0SqGk7tdQElLN+qrx3g9CRQ40B+DAgVFRoBq0sf
 ynDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gpGYZ51mi8hhhC+F+Plx5mr3AeFsfDp5LH+80r3coFU4ZTyBEVohU+49bZS35RozpWlvybxsvNpfKNMKOZQaM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzS5iokdFWlDKpNaE+CHgS9++CVgAQrOqRElYz93vMdk5F0RGGB
 m5est59er1oyqM+/R3uFIaUqotE4OndFM35lOVAXF7bxBoJts5Xo6SLL8BRCGNLd3RmeFHzzvZl
 qWw0ApRoPsFx0myj6y6f5SszDL+b0Yko=
X-Gm-Gg: AfdE7ckQf4/gYTielk8OG1IWadv+NvYenBRvKb0j22Kxz/n7CIsIMFXIckYy1eIeyK5
 hGw17MRscTmTDOil0rS3AYArAypX4smWv4hRm7NkLUlU6ZI57rXgtuRoEwipTF2a/MntvOSPRFv
 A1y02ezDPnA72bK9EdzjG3p+ma/0d+DGzPzbsLkPsPmNdy97Z0D1Oyn08dOebhUjxrfFChLUlLo
 /Rf3CWcIm6qz6574AgVtlG18hi+5NW/3gtqMToJifqdc2nBMytUG8mjbQm5p2eFaX5JS5QGvA==
X-Received: by 2002:a05:6000:4013:b0:461:a159:4a76 with SMTP id
 ffacd0b85a97d-462358d6658mr1423824f8f.1.1781664809519; Tue, 16 Jun 2026
 19:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260616123625.3300340-1-chao@kernel.org>
In-Reply-To: <20260616123625.3300340-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 17 Jun 2026 10:53:17 +0800
X-Gm-Features: AVVi8Cf5wQJasN0iI6WAz-AfpP1swy5mv79EAe78Bx6S2ldMV31TSrrDYYEFDVY
Message-ID: <CAHJ8P3JYKnQfd7PwQ0DQShy2UnsNfNZKeyDn7dyyyVkB3rKSww@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2026年6月16日周二 20:39写道：
    > > When allocating memory in aligned_xalloc(), if the requested alignment
    > (e.g., F2FS_DEFAULT_BLKSIZE) is smaller than the sy [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [209.85.221.41 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.41 listed in wl.mailspike.net]
X-Headers-End: 1wZgPM-0004c9-QA
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: adapt w/ page_size in
 aligned_xalloc()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niuzhiguo84@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niuzhiguo84@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B83F696312

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjblubQ25pyIMTbml6XlkajkuowgMjA6MznlhpnpgZPvvJoKPgo+
IFdoZW4gYWxsb2NhdGluZyBtZW1vcnkgaW4gYWxpZ25lZF94YWxsb2MoKSwgaWYgdGhlIHJlcXVl
c3RlZCBhbGlnbm1lbnQKPiAoZS5nLiwgRjJGU19ERUZBVUxUX0JMS1NJWkUpIGlzIHNtYWxsZXIg
dGhhbiB0aGUgc3lzdGVtJ3MgcGFnZSBzaXplLAo+IGFsaWduZWRfYWxsb2MoKSB3aWxsIGFsbG9j
YXRlIG1lbW9yeSB0aGF0IGlzIG5vdCBwYWdlLWFsaWduZWQgb24gc3lzdGVtcwo+IHdpdGggMTZL
QiBvciA2NEtCIHBhZ2Ugc2l6ZXMuCj4KPiBBcyBhIHJlc3VsdCwgc3Vic2VxdWVudCBjYWxscyB0
byBtYWR2aXNlKC4uLiwgTUFEVl9IVUdFUEFHRSkgd2lsbCBmYWlsCj4gYmVjYXVzZSBtYWR2aXNl
KCkgcmVxdWlyZXMgdGhlIG1lbW9yeSBhZGRyZXNzIGFuZCBsZW5ndGggdG8gYmUgcGFnZS1hbGln
bmVkLgo+Cj4gRml4IHRoaXMgYnkgZHluYW1pY2FsbHkgYWRqdXN0aW5nIHRoZSBhbGlnbm1lbnQg
YW5kIHJvdW5kaW5nIHVwIHRoZSByZXF1ZXN0ZWQKPiBhbGxvY2F0aW9uIHNpemUgKHZpYSByb3Vu
ZHVwKCkpIHRvIHRoZSBzeXN0ZW0ncyBwYWdlIHNpemUsIGVuc3VyaW5nIHRoYXQKPiBtZW1vcnkg
aXMgY29ycmVjdGx5IHBhZ2UtYWxpZ25lZCBmb3IgbWFkdmlzZSgpLiBBbHNvIHVwZGF0ZSBtYWR2
aXNlKCkgZmFpbHVyZQo+IHRvIGNhbGwgZGllKCkgZm9yIGJldHRlciBlcnJvciByZXBvcnRpbmcu
CkhpIENoYW8sCmRvbid0IHNlZSB0aGlzIHBhcnQgaW4gY3VycmVudCBwYXRjaD8gInVwZGF0ZSBt
YWR2aXNlKCkgZmFpbHVyZQp0byBjYWxsIGRpZSgpIGZvciBiZXR0ZXIgZXJyb3IgcmVwb3J0aW5n
Igp0aGFua3MhCgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+
IC0tLQo+ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
IHRvb2xzL2YyZnNfaW8vZjJmc19pby5oIHwgIDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jIGIv
dG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiBpbmRleCA5NGU2MWI4Li45YTg2NmNjIDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZz
X2lvLmMKPiBAQCAtOTcsNiArOTcsMjMgQEAgc3RhdGljIHZvaWQgKnhtYWxsb2Moc2l6ZV90IHNp
emUpCj4KPiAgc3RhdGljIHZvaWQgKmFsaWduZWRfeGFsbG9jKHNpemVfdCBhbGlnbm1lbnQsIHNp
emVfdCBzaXplKQo+ICB7Cj4gKyAgICAgICBsb25nIHBhZ2Vfc2l6ZSA9IEYyRlNfREVGQVVMVF9C
TEtTSVpFOwo+ICsKPiArI2lmZGVmIF9TQ19QQUdFU0laRQo+ICsgICAgICAgcGFnZV9zaXplID0g
c3lzY29uZihfU0NfUEFHRVNJWkUpOwo+ICsgICAgICAgaWYgKHBhZ2Vfc2l6ZSA8IDApCj4gKyAg
ICAgICAgICAgICAgIHBhZ2Vfc2l6ZSA9IEYyRlNfREVGQVVMVF9CTEtTSVpFOwo+ICsjZW5kaWYK
PiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogT24gc3lzdGVtcyB3aXRoIGxhcmdlIHBhZ2Ug
c2l6ZXMgKGUuZy4sIDE2S0IvNjRLQiksIGFsaWdubWVudCBhbmQKPiArICAgICAgICAqIGFsbG9j
YXRpb24gc2l6ZSBtdXN0IGJlIHBhZ2UtYWxpZ25lZCB0byBzYXRpc2Z5IG1hZHZpc2UoKS4KPiAr
ICAgICAgICAqLwo+ICsgICAgICAgaWYgKGFsaWdubWVudCA8IChzaXplX3QpcGFnZV9zaXplKQo+
ICsgICAgICAgICAgICAgICBhbGlnbm1lbnQgPSBwYWdlX3NpemU7Cj4gKwo+ICsgICAgICAgc2l6
ZSA9IHJvdW5kdXAoc2l6ZSwgYWxpZ25tZW50KTsKPiArCj4gICAgICAgICB2b2lkICpwID0gYWxp
Z25lZF9hbGxvYyhhbGlnbm1lbnQsIHNpemUpOwo+Cj4gICAgICAgICBpZiAoIXApCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5oIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgK
PiBpbmRleCA1Mzk5NjRmLi5jZjFjMzM0IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2YyZnNfaW8vZjJm
c19pby5oCj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPiBAQCAtNDksNiArNDksOSBA
QCB0eXBlZGVmIHUzMiAgIF9fYmUzMjsKPiAgI2VuZGlmCj4KPiAgI2RlZmluZSBGMkZTX0RFRkFV
TFRfQkxLU0laRSAgIDQwOTYKPiArI2lmbmRlZiByb3VuZHVwCj4gKyNkZWZpbmUgcm91bmR1cCh4
LCB5KSAgICAgICAgICAoKCgoeCkgKyAoKHkpIC0gMSkpIC8gKHkpKSAqICh5KSkKPiArI2VuZGlm
Cj4gICNkZWZpbmUgTkVXX0FERFIgICAgICAgMHhGRkZGRkZGRgo+Cj4gICNpZm5kZWYgRlNfSU9D
X0dFVEZMQUdTCj4gLS0KPiAyLjQ5LjAKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
