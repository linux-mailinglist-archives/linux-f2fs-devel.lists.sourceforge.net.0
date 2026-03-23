Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMdLH0ciwWmTQwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:21:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C92F11EC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:21:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VI33RZzdcY0em3Cdx1WhHyZUowqrhT3EMbTLoTh8p8=; b=jZLibjtSprocJr00huLZg51Kx1
	hKxXJFLloRs3iaUio9aRMMZWTQ3wgZkuUydNlWWVTHRr765HMtBCtv+HPFtE+++TNE6li+93Iub57
	GABg4ZHEV2a9+2psv3igx5ZdFpgiASZPcvCEGME22cq59yvvuzykV8/8Ohsmu436EatQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4dLh-00075r-4C;
	Mon, 23 Mar 2026 11:21:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geoo115@gmail.com>) id 1w4dLg-00075g-02
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3cEcb08vVAZPET7mzr3THVkEg4dX8DJXZ2uDFEvO98U=; b=W25GnmdHlScNSwMJQpgdtUnCH9
 hwZ0wEQSkHwUW9xQ8g0L2L1ikXnXt0yQvvVfVdq+OxzdDcJM39VnhTyb7n7Hn3k3X5HioS+jR/Amg
 A2R5cs69p9AnpOZE6kM/PHGhMNQqCCuTgxOibfErWlFuY0NuciFQ4KoBH2X7yIZsvpzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3cEcb08vVAZPET7mzr3THVkEg4dX8DJXZ2uDFEvO98U=; b=hiD3tBuA+UchfWOUl+OB7RQMaa
 SuAcdMdXK7L/PkaZLEYwaGiN1dJC3B+/40KT6Peczui/v2VQz0bLpI5uZnvAlN6mM3wFtuu0dv3Yn
 tR6oq7ev24fH9uMPW+iGlW+maXS1lyTFjOI+PlUO1iLlhhBgvb83i9GDZSFpIgx8A/Hw=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w4dLg-00018E-7y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:21:32 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486b9675d36so32872905e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2026 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774264886; x=1774869686; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cEcb08vVAZPET7mzr3THVkEg4dX8DJXZ2uDFEvO98U=;
 b=XyGDx8ITQqIxP5RIwnh03xH+44CrDDto05CSo0TGIFHsKyF+F1j7EgfIWBv9rSZmx6
 bu+5D35pPXJmyakw/dQ1bCfxWhQy5aY42iiUA0HdTgKiUY+t1yQjI6LH3JZDP5ub4e3d
 MCg3WHldTL3jUlMoTJloKNKWcyey0h4w5yXtDW5NBgr2+LYD0QlwdadGfIYy2mYHjiFU
 oHAaBw18QXFkS1Zoz6RyUlaRBEYXdtz7Gz+KQAwLXnqjiqbUU//T7ZuRZ0Mto/Te8AXD
 nfVx+Y2dLxxE0EaNnz7YWxmZ5OmEQReghmkgK/y0gfIm2X2DoPt1d0Ouf5nw581I8Z0d
 1Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774264886; x=1774869686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3cEcb08vVAZPET7mzr3THVkEg4dX8DJXZ2uDFEvO98U=;
 b=LuaRAurvT61Ai9FS1szLK5dSGKW3dSvwMzYdBH2UHVdt0tiHpsXp1oRwQaZWLjFJW7
 qYR9xMCQjzBkOrdkwk2Kv+tflcz+WBZ4Trje/IdaH5LOLvjJQlTEMQQ/AIR+OxFYf2kh
 e88asPoAXm1nYDULsBQR6RoZ7ENTzdmVJTABWxZkeBXLC4qgCGhaG+L5A3lhygLYQqsY
 9avBO0Izg9Hs9lcIJ/UCnow4UFwC/LnSXOQ/uaybBdu5tN+Jc4xb6GkTw1AB0B516Obc
 tIxnf4stRPxCbKrXxvhJV/PNjpZhqvtjrGbz+9XKVC1X+Cm8RkwZ3/T4L/b7iE8Vll7k
 XkOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+nYFsWg85T5hRXZSTL8islzDIN3vJBGeHl2uzdNQwlw4FxFNPqur0JmrXxGvXY8d6sjY5ij2L7snz5wv8EUJQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzb1NOf7DU1dx2iGf/UWsLPU7+LKIOwSZbMmnj9UtqilczsfTAq
 bq0S/JWzYRGlUST5BrU7CP8lryohOT2PtBzM6QDiaNZoKSGtcbT+KoUV
X-Gm-Gg: ATEYQzxMJTJlou242H+Js8hK3qPRhJZImWtj7+P/1gx4REz5sw9ppgpXuGtznKPMkrb
 ZXwTTfOG+CY2Hwc8a4TAQ+b0ThaX2UxdpC6D9vUdS2YfdRRXcFZkr1R5HQTgyw9YySRsLAR9nCJ
 WAf/2UamDyG5qITi+z/kWOZZsd34kvZaOKlURb+bssEgwWiZX9WNumikKJ/lUL9NRkkEOWxcwOS
 aGKLUpPKAh3FAGE/PjPKJDkclxMtHy/SKVVT2e9z/A6yOMsyPU8PwuZaC+OEyxCWmwBOo3QckIX
 bDeWqjtD9+JX50HGWq/N7Na0k6JYHCiXMkGurXxqm6z7ZgklpMG3azzE+cE23WwawzBlCmbZjKw
 f93xQPBNjdmBacfiVq87AY0rvck97rhB/JFiVZGZFkalxfQDUISOZs0bHEDamUILa5CSZ2v2Dev
 WOZhI/uM+nROUjwkXjw8DyfQie+OLdQBcnwpDMW2xAAtw/QB0td2/hk5niRLAP25k/Y/7TUqdgU
 fQZVG7KrkbDDUMtagYllTs+z9MPG8yej/r0RhpU2fsa
X-Received: by 2002:a5d:5f86:0:b0:43b:5356:a7f7 with SMTP id
 ffacd0b85a97d-43b6423db79mr18794794f8f.9.1774264885468; 
 Mon, 23 Mar 2026 04:21:25 -0700 (PDT)
Received: from fedora.communityfibre.co.uk
 ([2a02:6b6f:fb26:6400:da6:2a24:3e4a:d588])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644ae619sm30257656f8f.5.2026.03.23.04.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 04:21:24 -0700 (PDT)
From: George Saad <geoo115@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 23 Mar 2026 11:21:23 +0000
Message-ID: <20260323112123.786090-1-geoo115@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026032354-country-saddlebag-5331@gregkh>
References: <2026032354-country-saddlebag-5331@gregkh>
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_compress_write_end_io(), dec_page_count(sbi, type)
 can bring the F2FS_WB_CP_DATA counter to zero,
 unblocking f2fs_wait_on_all_pages()
 in f2fs_put_super() on a concurrent unmount CPU. The unmou [...] 
 Content analysis details:   (1.1 points, 5.0 required)
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
 digit [geoo115(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [geoo115(at)gmail.com]
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
X-Headers-End: 1w4dLg-00018E-7y
Subject: [f2fs-dev] [PATCH v4] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, George Saad <geoo115@gmail.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:geoo115@gmail.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: AD9C92F11EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SW4gZjJmc19jb21wcmVzc193cml0ZV9lbmRfaW8oKSwgZGVjX3BhZ2VfY291bnQoc2JpLCB0eXBl
KSBjYW4gYnJpbmcKdGhlIEYyRlNfV0JfQ1BfREFUQSBjb3VudGVyIHRvIHplcm8sIHVuYmxvY2tp
bmcKZjJmc193YWl0X29uX2FsbF9wYWdlcygpIGluIGYyZnNfcHV0X3N1cGVyKCkgb24gYSBjb25j
dXJyZW50IHVubW91bnQKQ1BVLiBUaGUgdW5tb3VudCBwYXRoIHRoZW4gcHJvY2VlZHMgdG8gY2Fs
bApmMmZzX2Rlc3Ryb3lfcGFnZV9hcnJheV9jYWNoZShzYmkpLCB3aGljaCBkZXN0cm95cwpzYmkt
PnBhZ2VfYXJyYXlfc2xhYiB2aWEga21lbV9jYWNoZV9kZXN0cm95KCksIGFuZCBldmVudHVhbGx5
CmtmcmVlKHNiaSkuIE1lYW53aGlsZSwgdGhlIGJpbyBjb21wbGV0aW9uIGNhbGxiYWNrIGlzIHN0
aWxsIGV4ZWN1dGluZzoKd2hlbiBpdCByZWFjaGVzIHBhZ2VfYXJyYXlfZnJlZShzYmksIC4uLiks
IGl0IGRlcmVmZXJlbmNlcwpzYmktPnBhZ2VfYXJyYXlfc2xhYiDigJQgYSBkZXN0cm95ZWQgc2xh
YiBjYWNoZSDigJQgdG8gY2FsbAprbWVtX2NhY2hlX2ZyZWUoKSwgY2F1c2luZyBhIHVzZS1hZnRl
ci1mcmVlLgoKVGhpcyBpcyB0aGUgc2FtZSBjbGFzcyBvZiBidWcgYXMgQ1ZFLTIwMjYtMjMyMzQg
KHdoaWNoIGZpeGVkIHRoZQplcXVpdmFsZW50IHJhY2UgaW4gZjJmc193cml0ZV9lbmRfaW8oKSBp
biBkYXRhLmMpLCBidXQgaW4gdGhlCmNvbXByZXNzZWQgd3JpdGViYWNrIGNvbXBsZXRpb24gcGF0
aCB0aGF0IHdhcyBub3QgY292ZXJlZCBieSB0aGF0IGZpeC4KCkZpeCB0aGlzIGJ5IG1vdmluZyBk
ZWNfcGFnZV9jb3VudCgpIHRvIGFmdGVyIHBhZ2VfYXJyYXlfZnJlZSgpLCBzbwp0aGF0IGFsbCBz
YmkgYWNjZXNzZXMgY29tcGxldGUgYmVmb3JlIHRoZSBjb3VudGVyIGRlY3JlbWVudCB0aGF0IGNh
bgp1bmJsb2NrIHVubW91bnQuIEZvciBub24tbGFzdCBmb2xpb3MgKHdoZXJlIGF0b21pY19kZWNf
cmV0dXJuIG9uCmNpYy0+cGVuZGluZ19wYWdlcyBpcyBub256ZXJvKSwgZGVjX3BhZ2VfY291bnQg
aXMgY2FsbGVkIGltbWVkaWF0ZWx5CmJlZm9yZSByZXR1cm5pbmcg4oCUIHBhZ2VfYXJyYXlfZnJl
ZSBpcyBub3QgcmVhY2hlZCBvbiB0aGlzIHBhdGgsIHNvCnRoZXJlIGlzIG5vIHBvc3QtZGVjcmVt
ZW50IHNiaSBhY2Nlc3MuIEZvciB0aGUgbGFzdCBmb2xpbywKcGFnZV9hcnJheV9mcmVlIHJ1bnMg
d2hpbGUgdGhlIEYyRlNfV0JfQ1BfREFUQSBjb3VudGVyIGlzIHN0aWxsCm5vbnplcm8gKHRoaXMg
Zm9saW8gaGFzIG5vdCB5ZXQgZGVjcmVtZW50ZWQgaXQpLCBrZWVwaW5nIHNiaSBhbGl2ZSwKYW5k
IGRlY19wYWdlX2NvdW50IHJ1bnMgYXMgdGhlIGZpbmFsIG9wZXJhdGlvbi4KCkZpeGVzOiA0Yzhm
ZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgU2FhZCA8Z2VvbzExNUBnbWFpbC5j
b20+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIFJld3JpdGUgZml4OiBpbnN0ZWFkIG9mIGNhY2hpbmcg
c2JpLT5wYWdlX2FycmF5X3NsYWIgKHdoaWNoIGlzCiAgZGVzdHJveWVkIGJ5IGttZW1fY2FjaGVf
ZGVzdHJveSBiZWZvcmUga2ZyZWUoc2JpKSksIG1vdmUKICBkZWNfcGFnZV9jb3VudCgpIHRvIGFm
dGVyIHBhZ2VfYXJyYXlfZnJlZSgpIHNvIGFsbCBzYmkgYWNjZXNzZXMKICBjb21wbGV0ZSBiZWZv
cmUgdGhlIGNvdW50ZXIgZGVjcmVtZW50IGNhbiB1bmJsb2NrIHVubW91bnQKICAoQ2hhbyBZdSkK
CkNoYW5nZXMgaW4gdjM6Ci0gQWRkIENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIGZvciBiYWNr
cG9ydCB0byBhZmZlY3RlZCBzdGFibGUga2VybmVscwoKQ2hhbmdlcyBpbiB2MjoKLSBGaXggRml4
ZXM6IHRhZyBjb21taXQgaGFzaCAoNGM4ZmY3MDk1YmVmLCB2ZXJpZmllZCBpbiBMaW51cydzIHRy
ZWUpCgogZnMvZjJmcy9jb21wcmVzcy5jIHwgMTQgKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwppbmRleCA3YjY4YmYyMjkuLmQ5ZDEw
NWVmYSAxMDA2NDQKLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCisrKyBiL2ZzL2YyZnMvY29tcHJl
c3MuYwpAQCAtMTQ4OSwxMCArMTQ4OSwxMCBAQCB2b2lkIGYyZnNfY29tcHJlc3Nfd3JpdGVfZW5k
X2lvKHN0cnVjdCBiaW8gKmJpbywgc3RydWN0IGZvbGlvICpmb2xpbykKIAogCWYyZnNfY29tcHJl
c3NfZnJlZV9wYWdlKHBhZ2UpOwogCi0JZGVjX3BhZ2VfY291bnQoc2JpLCB0eXBlKTsKLQotCWlm
IChhdG9taWNfZGVjX3JldHVybigmY2ljLT5wZW5kaW5nX3BhZ2VzKSkKKwlpZiAoYXRvbWljX2Rl
Y19yZXR1cm4oJmNpYy0+cGVuZGluZ19wYWdlcykpIHsKKwkJZGVjX3BhZ2VfY291bnQoc2JpLCB0
eXBlKTsKIAkJcmV0dXJuOworCX0KIAogCWZvciAoaSA9IDA7IGkgPCBjaWMtPm5yX3JwYWdlczsg
aSsrKSB7CiAJCVdBUk5fT04oIWNpYy0+cnBhZ2VzW2ldKTsKQEAgLTE1MDIsNiArMTUwMiwxNCBA
QCB2b2lkIGYyZnNfY29tcHJlc3Nfd3JpdGVfZW5kX2lvKHN0cnVjdCBiaW8gKmJpbywgc3RydWN0
IGZvbGlvICpmb2xpbykKIAogCXBhZ2VfYXJyYXlfZnJlZShzYmksIGNpYy0+cnBhZ2VzLCBjaWMt
Pm5yX3JwYWdlcyk7CiAJa21lbV9jYWNoZV9mcmVlKGNpY19lbnRyeV9zbGFiLCBjaWMpOworCisJ
LyoKKwkgKiBNYWtlIHN1cmUgZGVjX3BhZ2VfY291bnQoKSBpcyB0aGUgbGFzdCBhY2Nlc3MgdG8g
c2JpLgorCSAqIE9uY2UgaXQgZHJvcHMgdGhlIEYyRlNfV0JfQ1BfREFUQSBjb3VudGVyIHRvIHpl
cm8sIHRoZQorCSAqIHVubW91bnQgdGhyZWFkIGNhbiBwcm9jZWVkIHRvIGRlc3Ryb3kgc2JpIGFu
ZAorCSAqIHNiaS0+cGFnZV9hcnJheV9zbGFiLgorCSAqLworCWRlY19wYWdlX2NvdW50KHNiaSwg
dHlwZSk7CiB9CiAKIHN0YXRpYyBpbnQgZjJmc193cml0ZV9yYXdfcGFnZXMoc3RydWN0IGNvbXBy
ZXNzX2N0eCAqY2MsCi0tIAoyLjUzLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
