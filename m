Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAFfOzHpiGlRygQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 08 Feb 2026 20:51:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367510A0BC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 08 Feb 2026 20:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvy7gnicMLUArqebzoMchAdQU5xfHyqCOpM1HAL13mU=; b=d2Fk4aF7lKluepm3aSzfTPDoJu
	3yijC/Kv2f7rPebUdO+mtl4nMbmNE2O8sVgoS3Abtbh7AWnwPok68wU1tI3wO+gd90MWC3smU8eZE
	wSRVU9eH2a6SgeyAGp3xs1fekLqxX9XtOUGzJ3xkR1IyytktIJLH97VX0/0bqc/huCaU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpAo9-0001Qr-HZ;
	Sun, 08 Feb 2026 19:51:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1vpAo7-0001QY-LC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Feb 2026 19:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kuUQIPzLp/vHpvT0mZgO8hSxVZ3ISHyaHpQZdkLEjf0=; b=X27KKr64J3ZHxGKgIc1p5Ifads
 xz+VlXVye2qLU8Mr55GScr2U0M6l7FdLuzHLvN9ipLhl4imjNDCRV74Yas5iglPDbzkodiBhEqsO5
 wrYNZIfz2l2teaWf80N2oCEAnhtBp8Fs/fylLa0PVoK0CxSg5n7HAWQg4yF0FHyFUOqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kuUQIPzLp/vHpvT0mZgO8hSxVZ3ISHyaHpQZdkLEjf0=; b=YupdfocvlzjI8/Za342txbp2Vb
 eOHS+fUAdGAesYxl7ZsNUjx2/VntfyDb9Hd9KKg4H/0NL9dwNSC6ry4DNr79NS5RENTtCF/rLJmV3
 hzD7z309R2SC81saHVfLoiMvNHXkKngc4N79zQ+nBvq0OflQlhltqSgLyzYQeEnLSJsM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vpAo7-00069Z-Q4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Feb 2026 19:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770580253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuUQIPzLp/vHpvT0mZgO8hSxVZ3ISHyaHpQZdkLEjf0=;
 b=Z8kyOOZ7zt4dDK02c1HA0ZuNAczlYD1eEAUYbIbhwih4U+0uAfNyVBhNjNssxpM0FaCJAQ
 vgqpaKueAysBNXH+yR9leUjnpTMzf0ZHFW6PSCWFAvrSKZ0uVbpRXGO1CWAmIv3NPxOx9x
 ivMbtMSmJ2R5lhO8o6oAPlDBgApP65U=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-DVTDu5M9Oh2fw19Eud3Xow-1; Sun, 08 Feb 2026 14:50:52 -0500
X-MC-Unique: DVTDu5M9Oh2fw19Eud3Xow-1
X-Mimecast-MFC-AGG-ID: DVTDu5M9Oh2fw19Eud3Xow_1770580251
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-81efa628efbso2285331b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 08 Feb 2026 11:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770580251; x=1771185051;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kuUQIPzLp/vHpvT0mZgO8hSxVZ3ISHyaHpQZdkLEjf0=;
 b=nYlwN2g15obXoCv2+YgCfgBsy9AWjTUXsTvFQroKvu/1BMo1j57Nfx5ySuVtoz9eWl
 7SXMt+1+OxhTiEkK4zdZhegH9zeQq3b4c9unvPxIiGZOtR3Mqxqm3dPafMtGMx440nII
 38v6UfTRCOnS4cNOoIOwWsgYNz186TdA/YBUNlL7eApwXD/OK0+iSbfZJRFuoJn/FKd9
 VOg+/z5+RXstJ85LDE4BFicFArdFtRZh+aQ+YRQE9kDO9SflRmVrODfYgpX0pA8jotp1
 3N795byEyfuQTSZ6kTp5J+OoOlSyViEjVPAN21KI/ZaGq/16aQsTrx24QgTi8r1EI1KK
 OBJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFHlNM8YoFXrCTD/gsVzCo8mc97U5bWacUf4IhnuCxNTT3I38DLwzYS0uTl/4HEnjwZGaGY5kFfYenNKfzR4+b@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz6+qpZYM4jliHWq4nfR+zZwDDtTR8EzUpQOsiw0HNK3N01Lld2
 yBllCmFZFmpWtgvfRUw9yhrrUeq/pzDcPEgUQE4MlaRxBhRyxd4eNlLB1Fjy+pcV56zNsWun3B0
 4XbfNxDJOpRpFZmp1BZD4dzsHaIj9XUEnRx8T6BV7GD8qZ3GOiIIoG/wfBu0QZybjZ7WGwP1/21
 Ol9sJZVp9ZYRA=
X-Gm-Gg: AZuq6aIwoliRg0fYm7JvdqmCvJqQySd42gAUw+haKzIt/dy3CcDfjN1PdyJIlPhWKIr
 ORpRjMmAlL9QWHhd1BujQI0Ar5OBaT/xu0ZkQ5qh/WRVKL6kEhX2UIuXSqXPbVGxnaHl+SHmZGw
 bvgJzGuoB5K/pXYxrhl8cC1A7iP+rs3+/JRGKHo0dXyRExlXupvww27GAHfPcYuqysigAGHuXjR
 M9F0zwey39j7WZWOOFv8yw/smZV25Lhc9cx5AmbzXIJg/dWIrLBo2WcvbqpimjUPVuqRnWmBfFe
 xoB0qxvTE/CjFdxlS3ZLHISV0kU7o4X9BdjWb83t2AT9xmC1BUS+Y3uHCr2qTXfM8NBzc3sA8oK
 ecE+h8Lurjpi/eNMF/ZpsUyEiUhOE2BmfgMHhEljd51up4e94Rg==
X-Received: by 2002:a05:6a00:4215:b0:7e8:4471:ae55 with SMTP id
 d2e1a72fcca58-824416e3e25mr7454919b3a.33.1770580250611; 
 Sun, 08 Feb 2026 11:50:50 -0800 (PST)
X-Received: by 2002:a05:6a00:4215:b0:7e8:4471:ae55 with SMTP id
 d2e1a72fcca58-824416e3e25mr7454897b3a.33.1770580250141; 
 Sun, 08 Feb 2026 11:50:50 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6dda030abfsm5911093a12.32.2026.02.08.11.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 11:50:48 -0800 (PST)
Date: Mon, 9 Feb 2026 03:50:43 +0800
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260208195043.vhvkanq5pysbb74y@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20260108022501.754320-1-joannechien@google.com>
 <20260110013802.GB15541@frogsfrogsfrogs>
 <CACQK4XDtrE5P-PjwSqvGtmEmMvEQS4r2KZkDh55LXY2YAoH6vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACQK4XDtrE5P-PjwSqvGtmEmMvEQS4r2KZkDh55LXY2YAoH6vw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yvDJnYexuBeVkKijcVQrEhRRa1b05w2kY_dlZKE-b-8_1770580251
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 12, 2026 at 11:20:36AM +0800, Joanne Chang wrote:
 > On Sat, Jan 10, 2026 at 9:38 AM Darrick J. Wong <djwong@kernel.org> wrote:
 > > On Thu, Jan 08, 2026 at 02:25:01AM +0000, Joanne Chang wr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [170.10.133.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vpAo7-00069Z-Q4
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file
 helper
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: Joanne Chang <joannechien@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:joannechien@google.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[zlang@redhat.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,dell-per750-06-vm-08.rhts.eng.pek2.redhat.com:mid]
X-Rspamd-Queue-Id: 0367510A0BC
X-Rspamd-Action: no action

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMTE6MjA6MzZBTSArMDgwMCwgSm9hbm5lIENoYW5nIHdy
b3RlOgo+IE9uIFNhdCwgSmFuIDEwLCAyMDI2IGF0IDk6MzjigK9BTSBEYXJyaWNrIEouIFdvbmcg
PGRqd29uZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDA4LCAyMDI2IGF0IDAy
OjI1OjAxQU0gKzAwMDAsIEpvYW5uZSBDaGFuZyB3cm90ZToKPiA+ID4gZ2VuZXJpYy83MzUgYXR0
ZW1wdHMgdG8gY3JlYXRlIGEgZmlsZSB3aXRoIG5lYXJseSAyXjMyIGJsb2Nrcy4gSG93ZXZlciwK
PiA+ID4gc29tZSBmaWxlc3lzdGVtcyBoYXZlIGEgbWF4aW11bSBmaWxlIGJsb2NrIGxpbWl0IGJl
bG93IHRoaXMgdGhyZXNob2xkLgo+ID4gPiBGb3IgaW5zdGFuY2UsIEYyRlMgaXMgbGltaXRlZCB0
byBhcHByb3hpbWF0ZWx5IDJeMzAgYmxvY2tzIGR1ZSB0byB0aGUKPiA+ID4gY2FwYWNpdHkgb2Yg
dGhlIGlub2RlLiBTbyBhZGQgX3JlcXVpcmVfYmxvY2tzX2luX2ZpbGUgaGVscGVyIHRvIHNraXAg
dGhlCj4gPiA+IHRlc3QgaW4gc3VjaCBjYXNlcy4KPiA+ID4KPiA+ID4gVGhlIGhlbHBlciB1c2Vz
IGEgaGFyZGNvZGVkIGNvbnN0YW50IGluc3RlYWQgb2YgYSBwcm9ncmFtbWF0aWMgbWV0aG9kLAo+
ID4gPiBzbyB0aGF0IGJ1Z3Mgd2hpY2ggYWZmZWN0IHRoZSBtYXhpbXVtIGZpbGUgc2l6ZSBhcmUg
bm90IG1hc2tlZC4KPiA+Cj4gPiBOb3QgdG8gbWVudGlvbiB0cnlpbmcgdG8gY3JlYXRlIGEgZmls
ZSB3aXRoIDEsMDU3LDA1Myw0MzkgYmxvY2tzCj4gPiBhbGxvY2F0ZWQgdG8gaXQgd291bGQgcHJv
YmFibHkgdGFrZSBmb3JldmVyLgo+ID4KPiA+IEhhbmcgb24sIHdlJ3JlIHRhbGtpbmcgYWJvdXQg
aWJsb2NrcyAoYWthIHRoZSBudW1iZXIgb2YgYmxvY2tzIGFsbG9jYXRlZAo+ID4gdG8gdGhpcyBp
bm9kZSksIG5vdCB0aGUgbWF4aW11bSBmaWxlIHNpemUgaW4gYmxvY2tzLCByaWdodD8KPiA+Cj4g
PiBJZiBzbywgdGhlbiBtYXliZSB0aGlzIGZ1bmN0aW9uIGFuZCBpdHMgY29tbWVudHMgc2hvdWxk
Cj4gPiBzL2Jsb2Nrcy9pYmxvY2tzLz8gIE9yIGFtIEkgY29uZnVzZWQ/IDspCj4gPgo+ID4gLS1E
Cj4gCj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgZ2VuZXJpYy83MzUgY3JlYXRlcyBhIGxh
cmdlIGxvZ2ljYWwgZmlsZSwgYnV0Cj4gdGhlIGFjdHVhbCBwaHlzaWNhbCBibG9jayBhbGxvY2F0
aW9uIGlzIG11Y2ggc21hbGxlci4gQWxzbywgdGhlIEYyRlMKPiBsaW1pdGF0aW9uIGlzIGFib3V0
IGhvdyBtYW55IGJsb2NrcyB0aGUgaW5vZGUgY2FuIGFkZHJlc3MsIG5vIG1hdHRlciBpZgo+IHRo
ZSBibG9ja3MgYXJlIGFjdHVhbGx5IGFsbG9jYXRlZC4KPiAKPiBTbyBJIGJlbGlldmUgdGhlIHJl
cXVpcmVtZW50IGlzIGFib3V0IHRoZSBtYXhpbXVtIGZpbGUgc2l6ZSBpbiBibG9ja3MsCj4gbm90
IHRoZSBudW1iZXIgb2YgYmxvY2tzIGFjdHVhbGx5IGFsbG9jYXRlZC4gRG9lcyBpdCBtYWtlIHNl
bnNlIHRvIGtlZXAKPiB0aGUgbmFtZSwgb3IgZG8geW91IHRoaW5rIGFub3RoZXIgdGVybSB3b3Vs
ZCBiZSBjbGVhcmVyPyBJIGFwcHJlY2lhdGUKPiB5b3VyIHRob3VnaHRzIG9uIHRoaXMuCgpIaSBE
YXJyaWNrLAoKSSB0aGluayBKb2FubmUncyBleHBsYW5hdGlvbiBtYWtlcyBzZW5zZSwgaWYgeW91
IGRvbid0IGhhdmUgbW9yZSByZXZpZXcgcG9pbnRzCm9uIGl0LCBJJ2xsIG1lcmdlIHRoaXMgcGF0
Y2guCgpUaGFua3MsClpvcnJvCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBKb2FubmUKPiAKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
