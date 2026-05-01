Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODV7Nd6x9GnVDgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 15:59:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ADA4ACF9B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 15:59:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y44K41NiwloLeO7OMdn0cswDBVfuXM7JJRLr8EtgQmY=; b=Kt1Ng79dZFnCzHJUxfMcYjfnTZ
	1DlUFu0lrRDgKCK5cj8ACIeiVVmVluLFhgLtlVoYsWYsnMZWzLi+/lRmhxlvojDpdfvgr3nqrEocr
	6/m5W47rrSgFvB34jvWK3Jw8rakY+cNFyTt2+gz7229jgCw7GktcMITlf2Jtv1dsez0M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIoPB-00020a-LD;
	Fri, 01 May 2026 13:59:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wIoPA-00020U-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 13:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HcWDznFbvB0SxIzHa3fS4G2AcKHlsoy6JnUL2VqzQFE=; b=JiFw3lDpMsyqh32w7kWgOW8W27
 MI9XXrmrtxTIxf8mf/fIaZsbqXvl1RVg+j39ZHWV+xZElJ8abSbv4jGjZ5wqQ+CAUZJGwBG+H6NSM
 dFREyXAQcTQxACh0JD1aCKmmPLJfJFQIk7/1vZFgxAXpFLkqoRA1yFFboXjNbJF93kIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HcWDznFbvB0SxIzHa3fS4G2AcKHlsoy6JnUL2VqzQFE=; b=SxxPFMIX/1XkMFbdWMkjJThMCo
 jveJqPhrcqf9FqUzUvypM2c9FW83pzEd1qI0hcVDUnywSSXkCg+eu+ODSbaZqeEcYuRUa1VJgjJQN
 kIYqnrwlCsS/dmPHznCxW3k7dFSfYk6Gl1HybOSlE57bCTL5v6junAgCU0Y+iJGaPW9k=;
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wIoP7-0005p2-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 13:59:42 +0000
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5ff05af29b4so669587137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2026 06:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777643971; cv=none;
 d=google.com; s=arc-20240605;
 b=YlPlUEcnP9RqugOkRLOrsJ8lgIKUH2OVGpDZ/1y1HJy7VtPqSm7RYOTckwGVL6qUG/
 M50Z7cMzP1bR3yk/KycdfdkMeGIaGyoeEJptByEJhrMAygc/y8EwcZWqEAi43CipmdMb
 Kd+X0zpZjlWtndI1dMOmdCbIDhAFSFLHU+CT7gP28fgfiyvO1ybVzy2OQug34Wiam6K6
 ha4/HbbEpE+FRamf/q2ZYINYenj6g8LHaz+A5MMlbNuT0FpC941zzy9ux8eUpWx3yKJp
 6he4QBGp/THQRYcXs/uihK//ejVHUsxyh4ZRKrMda2bvxwclV6Kn/kz066cKVFURyvUu
 u6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HcWDznFbvB0SxIzHa3fS4G2AcKHlsoy6JnUL2VqzQFE=;
 fh=DpN65qerMYeNO5Q6pQGt6eduvovD2Bjr+etlqtXKc+E=;
 b=etXIJPwxRpt5VyqiOxEa8Ap9INYnQ8bNHQAYnzqE0PVzdJRFdMPO/UsXxF8hyXocU+
 ZXodNMHoCCsv2v55AE89syH4gBbgPAqauuDp/h5HMFWYaJirWmEKVj9gb4Kf2ewzU4jV
 /4u32hd5oNHLVDRxCnHzg304kyZd9ERReE/dhuqspt3K9LELNrtV0W3t2CcoEZqcUd8v
 77LtqCM8PhJzRwulQb6bXlOxlfRdUtJH5UxkY7ftfQ0633m+qCbqrwsY4GsnRO7OlzcM
 Y29jwtC1DQg4I9l64Xng27oHDbKyvmq2KRW3G+nF34lHY82MqMGO+wB+T5NeFV1wvtnn
 MrOA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777643971; x=1778248771; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcWDznFbvB0SxIzHa3fS4G2AcKHlsoy6JnUL2VqzQFE=;
 b=cq7cjxELebC6jP9mGjt8vUjIcctimTjgOVL++oB1Xkfvd92YzEHXFn7HqOpTqYRbYb
 DPQroXzGD6Be8uc8PPBTbH+m3203p2LV+pTfvBkvKVsOkmHg5GhzPVxOrYybev6h9cLq
 EeaYwm3eDJiwkfDJo59+AoDJP4ZC/Ty07NeA6Ys6oR5RxIWvcnvbIT/uo3JW0m9mkN90
 6K7tXkK+NdrjvqDSJkBCEvZRM/iOQmELJurvYEkmEAH7xgeQrmfggmg6noXxLQbgswPz
 1W8Xoe+wqUexA7MN6PY0uNe8hb26119KFrGPKghAu+B0TJUYOFkF1BdvgFzon4X57QbJ
 Aceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777643971; x=1778248771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HcWDznFbvB0SxIzHa3fS4G2AcKHlsoy6JnUL2VqzQFE=;
 b=plYYlboR4V10j9GFBuj6MuOYdDJKWALrJnIkvh+zBwYXhreoCfbVDqkP5b7A0/VVIW
 34SzjM9kYBW0/ycQCPWzaQgqvtsd218LKRGl9scffI6GvR0VDor4GOwV/JDtOpRiwggI
 WgVNwjqwxVEzI5d5Yj/daN3xhHKDX9XLPYFZ+iMLPfUkyOgjPBvQC7qX0Myon59GjsUw
 byHyGl39TOCtnmAFDFelEqoV2op4Ada7h7MANGx6nm2o3iaC2C/6rFt98cvPoko7Y77j
 P7Jf+kZSeZak9vOXU8bmtDh7r2+rfbmnJRx1YNBlak5j29sEmIg2VdYjFFe6i9kf4KrQ
 VzfA==
X-Gm-Message-State: AOJu0Yx0ky/lfY4nGCWxbtll/vII67VoB7aRRUNw/NvgAc5E8Q8GMu3c
 WoBmA5QpeIphfpdBa5c8yifRtkHi0SY4g53qujF4wbZNqxUHo2tr7R6LUfN46Wr1gdWHb1WmKW8
 8716zLSDfYHat3RegZFhM5S2yXUrilW4=
X-Gm-Gg: AeBDievgv8p5SnO+re4vNClFi0UXkqR7Zn5yb4LVZVucDa1JmCP0bxWJDXsODk+0dop
 wfPRf6ioP7m9AxbcdlHNOalxpgrqUJvEwl58U7BTiOpTFq/+nnrCP4YfVIiGLAMlXl0BgroWhvr
 rCyjYwX5zdBdEUDqhSrxu9KPJ4h6FKH/vObm8wF9UQsxSJwoWrTaw75Mvj4AtqrPDEJkjnPnNhL
 WS5yOgbDujW44BmYSaWDOC7izc40o8EJebPEnTbxaHorTrtQyP8kf8052QbPTZCcZ+SWMiSQG38
 Cy+FGHCOWFTxCSfXARLjC7rRawu072svLERDZmxVhP9I8M4gqvvmeL6iIhXxFj1DHIg/kEbCGRw
 fYap4E/Q=
X-Received: by 2002:a05:6102:26cc:b0:612:13af:f5dd with SMTP id
 ada2fe7eead31-62ad3d4ebffmr3752376137.17.1777643970586; Fri, 01 May 2026
 06:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260409134649.3693469-1-jaegeuk@kernel.org>
In-Reply-To: <20260409134649.3693469-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 1 May 2026 06:59:19 -0700
X-Gm-Features: AVHnY4IHNTcqY031Ex8lvGs5yGrdK4KTkzs1LFiFyKKPWPzXzrZdy40fZ87XwuU
Message-ID: <CACOAw_zkTCTwBZ=WPHa87ZzaYQTmXMjGh4ZtDkv-PFpkS0X09g@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 9,
 2026 at 6:49 AM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > Signed-off-by: Jaegeuk Kim > --- > tools/f2fs_io/f2fs_io.c | 8
 +++++--- > 1 file changed, 5 insertions(+), 3 deletions(-) [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.47 listed in wl.mailspike.net]
X-Headers-End: 1wIoP7-0005p2-JQ
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: fix length for setxattr
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 30ADA4ACF9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

T24gVGh1LCBBcHIgOSwgMjAyNiBhdCA2OjQ54oCvQU0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYy
ZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToK
Pgo+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIHRvb2xzL2YyZnNfaW8vZjJmc19pby5jIHwgOCArKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2YyZnNfaW8vZjJmc19pby5jIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiBpbmRleCBjNWYx
ZGEzZTYzMTMuLjY4MGMwNjIxODM5NCAxMDA2NDQKPiAtLS0gYS90b29scy9mMmZzX2lvL2YyZnNf
aW8uYwo+ICsrKyBiL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gQEAgLTIwODEsNyArMjA4MSw3
IEBAIHN0YXRpYyB2b2lkIGRvX2xpc3R4YXR0cihpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0
IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+Cj4gIHN0YXRpYyB2b2lkIGRvX3NldHhhdHRyKGludCBh
cmdjLCBjaGFyICoqYXJndiwgY29uc3Qgc3RydWN0IGNtZF9kZXNjICpjbWQpCj4gIHsKPiAtICAg
ICAgIGludCByZXQ7Cj4gKyAgICAgICBpbnQgcmV0LCBsZW47Cj4gICAgICAgICBjaGFyICp2YWx1
ZTsKPiAgICAgICAgIHVuc2lnbmVkIGNoYXIgdG1wOwo+Cj4gQEAgLTIwOTQsMTUgKzIwOTQsMTcg
QEAgc3RhdGljIHZvaWQgZG9fc2V0eGF0dHIoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBz
dHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiAgICAgICAgIGlmICghc3RyY21wKGFyZ3ZbMV0sIEYyRlNf
U1lTVEVNX0FEVklTRV9OQU1FKSkgewo+ICAgICAgICAgICAgICAgICB0bXAgPSBzdHJ0b3VsKGFy
Z3ZbMl0sIE5VTEwsIDApOwo+ICAgICAgICAgICAgICAgICB2YWx1ZSA9IChjaGFyICopJnRtcDsK
PiArICAgICAgICAgICAgICAgbGVuID0gMTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAg
ICAgICAgIHZhbHVlID0gYXJndlsyXTsKPiArICAgICAgICAgICAgICAgbGVuID0gc3RybGVuKHZh
bHVlKTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgcmV0ID0gc2V0eGF0dHIoYXJndlszXSwgYXJn
dlsxXSwgdmFsdWUsIHN0cmxlbihhcmd2WzJdKSwgWEFUVFJfQ1JFQVRFKTsKPiArICAgICAgIHJl
dCA9IHNldHhhdHRyKGFyZ3ZbM10sIGFyZ3ZbMV0sIHZhbHVlLCBsZW4sIFhBVFRSX0NSRUFURSk7
Cj4gICAgICAgICBwcmludGYoInNldHhhdHRyICVzIENSRUFURTogbmFtZTogJXMsIHZhbHVlOiAl
czogcmV0PSVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3ZbM10sIGFyZ3ZbMV0s
IGFyZ3ZbMl0sIHJldCk7Cj4gICAgICAgICBpZiAocmV0IDwgMCAmJiBlcnJubyA9PSBFRVhJU1Qp
IHsKPiAtICAgICAgICAgICAgICAgcmV0ID0gc2V0eGF0dHIoYXJndlszXSwgYXJndlsxXSwgdmFs
dWUsIHN0cmxlbihhcmd2WzJdKSwgWEFUVFJfUkVQTEFDRSk7Cj4gKyAgICAgICAgICAgICAgIHJl
dCA9IHNldHhhdHRyKGFyZ3ZbM10sIGFyZ3ZbMV0sIHZhbHVlLCBsZW4sIFhBVFRSX1JFUExBQ0Up
Owo+ICAgICAgICAgICAgICAgICBwcmludGYoInNldHhhdHRyICVzIFJFUExBQ0U6IG5hbWU6ICVz
LCB2YWx1ZTogJXM6IHJldD0lZFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGFyZ3ZbM10sIGFyZ3ZbMV0sIGFyZ3ZbMl0sIHJldCk7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjUz
LjAuMTIxMy5nZDlhMTQ5OTRkZS1nb29nCj4KPgoKUmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxk
YWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3MsCgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
