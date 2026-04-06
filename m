Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJsDI9Pu02nInwcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 19:35:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA843A5BC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 19:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45dEYeJoGLnSvpjtCxDixuQoqGXdFqmtG9zpMpqUkXo=; b=XrdLrBud8LdBz279WtLQA2u2RI
	ucX5NDCI1x9xJWiTReuLL+oz1kJicihzrNwYfhe+VYrABF2rDx1Tk3r5eatdJCnA1ojmmRzCABCOm
	xwK0dhrHVzplLMy+9QNQwjv+/amEjPdNlb0JqU6kwmlgBFCEXl+Tz3Up6OkT/qnvMX9I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w9nqs-0004dj-6K;
	Mon, 06 Apr 2026 17:35:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w9nqr-0004da-1x
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 17:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4dSrDI1gplWNzAP9jV8RqSc1+x7eTkaA9lKtYTjCRjU=; b=cv4FQH8PMVgGvXwiS9b7PFnG9/
 oSsjtP8VUyvZpYfjTkENe+PYd0HzZbRz+yHpJ/1Yiohe9hY3jN3tNvCTIzceXbEIjjyozVrAiZp4L
 RMmIZvTkeEl8Zfp1LUmvieTEBdQ3I5dUaGs/8qQ58eys++PLBfvUFoB0dbULbB7+g8Us=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4dSrDI1gplWNzAP9jV8RqSc1+x7eTkaA9lKtYTjCRjU=; b=Totua+BWCuzJsrxjodDwLjipws
 uw4TZIqOIixWPLJKFKLrLsRR0extFQXqFzwDJSzzFdFF6UegX74w5QpBUHMqroGTTJ0Az7A8K9RA8
 t/xwWGok1YJ6DcC68GuR9+hjFscpRmMOmueuUjKyjBa3ujsgO3vC/Bfe1+Cf2o3BPpeU=;
Received: from mail-yx1-f53.google.com ([74.125.224.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w9nqq-0007bE-Ba for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 17:35:04 +0000
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64937edbc9eso3543004d50.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Apr 2026 10:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775496893; cv=none;
 d=google.com; s=arc-20240605;
 b=QM6FjI8AJorm2rAyezqtu5Lo9spONZhdAtv+nBWNNscCepSR9yw3J1aipZBkPlleye
 kwrZ7N9PdrZem2Yu9Qg04oHt60whoS5a5RD6kdm+AjCGP5jVcp1FWpJ0nAF0RRNyym3m
 pjgenP4MizReY36o6W1xclgUutvEv/yR0tCpYSoQMEht47CypjeyDH78r9k5ulJFjXYq
 9+SXT9gBJnrf21mHDJgr8vkkTkXc7KKRkd4qWO54iQ6bZtFtFaiCWBHELfPys9VyCEUR
 R+erK/UxlcHRrNIZseJzx80NQc33sNLA7B2BrPwAGGX9BOFXckq+JNhoIFmAC8R8dz+q
 QfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4dSrDI1gplWNzAP9jV8RqSc1+x7eTkaA9lKtYTjCRjU=;
 fh=Ts8nXWUT7+CdtqIgOktmV5GC2ciB/X/nWTqS1naQsOU=;
 b=Ds1YNNcLBFtSotnML3b6Edai2UtbxYtDtrG7UDfFidEk5UQ7b3hJjoqWi5RvtcoZgP
 bLft4AHOnzIrs5TQsIKT0wWZKjT2GIVqo8C9hcPKyYprZQa7YYZKkFS0uPm7VXiUHa+T
 LHIAU8PDP6AMkHfvyrmJLN+E5WO5opHLABne1T+ij9o7+0KD3pQBJrcQhVBY94okeMa+
 TGmJSqlVWCo0weKZjHqRxx+16dC9lmVS3AyDjhWMMrobEXr5fMt0udKVlamFywMpnVxn
 iL7LGbgnhvRV0a3SxLrsZb+cK/X7/POQ1dX1K9Bx4gF8750yPZr4sgdzSst7QXePL3V+
 yf6Q==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775496893; x=1776101693; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dSrDI1gplWNzAP9jV8RqSc1+x7eTkaA9lKtYTjCRjU=;
 b=lN4435XXFOKmfRrAUq2c4CE67Xi1ld1jqEZCPudi29lypdbKZG0Cy+359Ip8hew4Yj
 mS6adWQSKAc3OZXnuCg5XiiU6DjU8TJlzVWqjV7LUqt5+lGElF2vx0GRlnl9leDCBTSF
 R6/AEK3yvAr2PteIBhf3F/SHxsZ6BkOcrHW+oxEzl8oHRN0SEdW+mcJwpTizCUkyLZTr
 pjwvU51npSBQbRkuJLHfhJE7HIS7isNvinHrfVmGjg6FsVcMxPwNb7jpIUtHfhxXFiFw
 32+zh2ouExWTFbqRpfEYRjP7pJadTqQiV4lV9sTDZGxHi0PQEHqoBrWAzGGXAfN7PBE/
 BxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775496893; x=1776101693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4dSrDI1gplWNzAP9jV8RqSc1+x7eTkaA9lKtYTjCRjU=;
 b=QEAI+oKJ8fqkiaai9CO8gf99akNd8ZBJqrn659r5e/4XWzRdoftX586BT8dbU/dxpX
 FJUZQx4x5nv1KdNKpdxtrn+B/P9LLySRygC5kGnhVXta/QtTkjiYPGw2f2pXRkYQW8kA
 9XfkbV8duTRQe1ib1df7/VuvbYU/O9A8z+lk8BBPVBHQnPWrfdUDqk769shc8ssY4IlS
 0r3u2Wjo1aceFwdbQf8ND4gu+hdeoOdML3J28IJXoCCouFyAfpgzVu86GBboyMRQ4Gb8
 1nwPvLFRPYEodFYpYf5F5sFcPL8IcoUy2TYF2Z62DQw5DdZc0cP1yOYmbJD9LL2bZ1St
 EbUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2XxprjQLSgFbWB0YL0RzEsMD1lbtcZ+Pyt47cTtQnmBQIPaQbHXJn/iMiNdhZGW+BWm9pCNX9bYddkvUSV7fp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YygtH/OidT2vr6Dp0iKSDbi+A3v7HwHa9rEgO8rdfh1/3sZ/Mz+
 fZXH+QVOqasn7canxFkV0ancg8hm9vdiLMc5tD4oOHAGSz5L4np5asx6DUp5FEeOSirGMLykf7+
 3+n63xmhGOYj8sZX0s5DCFjIMCrzWssM=
X-Gm-Gg: AeBDies2w/KyIGC32rumcns4e2JKVADWKVStJ+ED74+Ksw+PSDQq8nG02/MC6moOcM2
 sknUR0oiTk8uPPZsYcT5qb2WtK+/VZDd1kD/j7JnE7i277TOiVynBy5Mgo6ZNi/BmhteKbfRLM3
 4VL+fotQ3DQOCYG7x4g+mCUMhZd/5MrVLndmuJ+3uHpQHF4bcbWa03TC6q7cibY9GEqN0MD6NXA
 C/FnBlgECFXLB1Q8UQwavAMBbGf9ONqUcKN58xnyyzUx2iQzh5eg8R1V/wyodNoDRx0JFTXofJt
 /DYL+7d4Sw0mUyQ7OgzTxaSAszKlnsU9vl1sieYD5VbHX5hesKZoIDhdXsIWag1o/P7TtAEX
X-Received: by 2002:a05:690e:1487:b0:650:5316:1738 with SMTP id
 956f58d0204a3-650531623famr9174857d50.39.1775496893415; Mon, 06 Apr 2026
 10:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260331174326.231867-1-jaegeuk@kernel.org>
 <adPmWCgtruKjGDYO@google.com>
In-Reply-To: <adPmWCgtruKjGDYO@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 6 Apr 2026 10:34:40 -0700
X-Gm-Features: AQROBzBVlVbf4LTxchNBJ9XAOJY3oyrN-D-OdDsiNTstJMXoLbZ85seDy1fa8QU
Message-ID: <CACOAw_zOOiVvLjNP5Q6=kBw9HLHHno6F_nq+gx2ugGpLCw9c1Q@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 4.1 (++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 6,
 2026 at 10:00 AM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > Let's check mmap writes onto the large folio. > > Signed-off-by:
 Jaegeuk Kim > --- > fs/f2fs/file.c | 3 ++- > 1 file cha [...] 
 Content analysis details:   (4.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 4.0 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?74.125.224.53>]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [74.125.224.53 listed in wl.mailspike.net]
X-Headers-End: 1w9nqq-0007bE-Ba
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow empty mount string for
 Opt_usr|grp|projjquota
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: DAA843A5BC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCAxMDowMOKAr0FNIEphZWdldWsgS2ltIHZpYSBMaW51eC1m
MmZzLWRldmVsCjxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6
Cj4KPiBMZXQncyBjaGVjayBtbWFwIHdyaXRlcyBvbnRvIHRoZSBsYXJnZSBmb2xpby4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZz
L2YyZnMvZmlsZS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9m
aWxlLmMKPiBpbmRleCAyYzQ4ODBmMjRiNTQuLjY1MmI0NTM0MzQ5YiAxMDA2NDQKPiAtLS0gYS9m
cy9mMmZzL2ZpbGUuYwo+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gQEAgLTgyLDcgKzgyLDggQEAg
c3RhdGljIHZtX2ZhdWx0X3QgZjJmc192bV9wYWdlX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2
bWYpCj4gICAgICAgICBpbnQgZXJyID0gMDsKPiAgICAgICAgIHZtX2ZhdWx0X3QgcmV0Owo+Cj4g
LSAgICAgICBpZiAodW5saWtlbHkoSVNfSU1NVVRBQkxFKGlub2RlKSkpCj4gKyAgICAgICBpZiAo
dW5saWtlbHkoSVNfSU1NVVRBQkxFKGlub2RlKSkgfHwKPiArICAgICAgICAgICBtYXBwaW5nX2xh
cmdlX2ZvbGlvX3N1cHBvcnQoaW5vZGUtPmlfbWFwcGluZykpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBWTV9GQVVMVF9TSUdCVVM7Cj4KPiAgICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfQ09NUFJFU1NfUkVMRUFTRUQpKSB7Cj4gLS0KPiAyLjUzLjAuMTIxMy5nZDlhMTQ5
OTRkZS1nb29nCj4KPgoKUmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+Cgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
