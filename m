Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OBWOa/5/mng0gAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 11:09:03 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A84FEEC7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 11:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzaUHt1NQSnacWlHWmYBOUoATgnDtkO5FGoOZ9uwk1s=; b=cLIivzrt7H4b+BMgaEdmpGWoPt
	+Ai5WpP4vwBSuR32jCcvQFyouW6Qt56P2i1MAMFF0xyseLqrWI4fG/N2keWTrtpfb7IQrzemLSFZr
	YX6pX7of56FA0PBEjtzWzMcefjchWwo4exZIGOB7rMVlioOcuzsxLGmp7hFoxRWMka/8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLdg0-0007FR-GA;
	Sat, 09 May 2026 09:08:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1wLdfy-0007FJ-TZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 09:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/WDY4Y2OT4QgMsrPidU0JdpeCI6zSS8TCN0XFs+3IE=; b=Mjhx/GbYWoyuuFxGwctOTaefgc
 QPIEZt9HyEp6kSCdCEkr1/2XQidip220yBz7uj+078qm8m/GtUUIFNLVGuSkwGntu5J5bfFX9cOXq
 A5vpeBfWX23jZB1jXzJTWUXgG9f6W4+SrnvoNgV7iuGusRuvpCEQmCJK47/Zlw2Olgbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n/WDY4Y2OT4QgMsrPidU0JdpeCI6zSS8TCN0XFs+3IE=; b=ci0iuvjKnXlnTJyQ614RFw9yGE
 La/zcgp17RoacQeisG7sOIqsVR3meAZ11HdvbYSWa0rHkv5DpbmwBAPiAZZY4iKtwSZgJO5Yri9E0
 8WNw1Zu8OlAs3IUbwkKxpu4hRJPCgIu0uDzEQqJSK17i2ciZL6tl661gqoK1RQLqgPYA=;
Received: from mail-yw1-f179.google.com ([209.85.128.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wLdfz-0008Gj-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 09:08:47 +0000
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-7bf0b47d2f1so25055087b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 09 May 2026 02:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778317716; cv=none;
 d=google.com; s=arc-20240605;
 b=VtviLLIBlTPKmjrkpSdMNFFuMQaYbJhxCARCzALmEEqBQmevi6I3gjsRRDBGYBglLy
 IOyCCXPb5MtGf8oa4BZwbWjAj6bpO/ryhzBgZPXPhbBA+s/8S58V7gkRuh9EuexitLT8
 yACvdi5cnFvmSwPE3gvPZlxz5UBP/eC8BfhTllWQO2o4sL4Ky3XuvrwPrEkh9x3EVHpP
 xz1b+Aj6TuoWypU/1RU/uPAOEhJqlxIfiXa5itVlhGYKDL05HKfsYpA5H0axxOwBjvfm
 hQ3enqe1OsEyrc7CYwaKhCZCas43Tgg6nwTvsDPNpqI/9uolVop6jReObd1Jd4Vc1Bgc
 xOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=n/WDY4Y2OT4QgMsrPidU0JdpeCI6zSS8TCN0XFs+3IE=;
 fh=+/pCguBlqbSQUUaaCQmXEHPaWZq5Ye8IVAJTKADCoKU=;
 b=UIYxezwcB+1oRwBFD59wjz3AaBmtqJ7VV2JunlfGOY3zbOFS/SmdFpR/FPYWTeNxj+
 hg1MsTMrBUg9YSVqiXWntWQnAvOAHWqUiAubvInoL4wRSl9AwzLxxkCuLOm2ZPRlphdl
 5Tt42vQ+rQuv0/337KNnMtR1gBpFtnou1ELxg5TnuILXbx0t6TESAH4p5Ge14Q1TXa4r
 yMPErP9anefsYPCvhkhrbl2lMXv7SvXpDNQYoqaRDg8SqFjoSw7iHhT9bz1TH73rROB2
 wOw1Ogyf5xRrXGm3rFzwmEs8b6tCjRlPGy1gJlh4G+pzQEgTZoaoY3ppAjdMJVR/JJ1q
 LDZQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778317716; x=1778922516; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/WDY4Y2OT4QgMsrPidU0JdpeCI6zSS8TCN0XFs+3IE=;
 b=pajrrQ8AKXx31t4YKS5sdqWhOvlNW1zGsxZNwiy2VlOa3OAwdFYGt9Zt8MLCOVIYLV
 sdlfGRTUewW+/YRtC3vWyVGs/tQnjefbQkYgw/ebsv/yIwUY+zHGkkuDWQYpld6+IBbo
 ess5+LrBdm1E6ygtT6BcSFqK3NDJEXura6jC5Zvnsnky4vPDzvhpdQbgeL/bykbkHjoL
 GEWlDEwTavPh9NlqZqTf4CWujMnHVMlha3r2ajWS+xMNSvC6OMuKzSmbVRDbfLFyXmpX
 upsW4wnAZt3GxcQv46F3M6j0CQ8zSqni682ZlwttxZucraM/f5el0AjapurfQ436OkTZ
 2l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778317716; x=1778922516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n/WDY4Y2OT4QgMsrPidU0JdpeCI6zSS8TCN0XFs+3IE=;
 b=FS2bppRyKodTx/zPqsLQI7s5jNB1Hi9HNul1/uX2wgVMA54OsgSa1gk90Oa/cY78gu
 eVDbzFewofVkILm0Y9dLKBDDraXj4nPBvmVF274OI1UT9TdbCFQnwo/KY7bKRxYSC6IH
 V/ekHzsj0pon3Z7y1WgrILbOpAdom1hEycTMk8ZtDt4VbVwROiXif4Df1cNWAajJONXo
 ZUzfnTKMfJVTcaiI+Cdllg7nxMuNC93I+//VfsVN1BpC9oBd8hosLwl4xSpUBCF2KgXA
 J1ecaK6GY6LClJcAVUNcX+1Up8LhvTgZYqZlC7tpU1OVmcFnlWJM2J8kmXbn1Z3wbxP/
 JvXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zqq2gsDUNWnDLuCuSWEpom8KzUvZxV27tcz/7h7fyv1KaduHDdS0Bpfs4cEZyISSYBLWg5QkCJ+BGyMsm4bjG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyzIawXaASipQcVoAs9F13/mPOwJVv8WcEtsborG4GxdO+LSPDn
 tqnJ2tWLgSXlaVQMwEb2mwG370MLgETwl9MqoP3sjLHExo0WI0ZyUhTkgMPmcrzPqp/HPW4oZjj
 obJGN6wHgOpUPZld8KYHRfthr/tYtHxA=
X-Gm-Gg: Acq92OGPK+1Ag4Zuz4uBlXenfR0Y9SXzWtwH6zqS+3pUe05bz+piOhRTypS1GoixIE1
 sNgnZUOplDyTAuxz+A5B/IYZmAKy1NxUTkwi69bVOmKR2MfsBCtlOnk18k6CH2wfFqy6dm5XPm8
 1+1L9OcfHNaeal2j4U+Ff6Km1iYqQUaWEooKNn+99oeek72XIQjF7jRiEWgkJwTr7Nf7Jn17SyX
 DvdkYm9Ie8UkDNLat3PzjKm6cq+Q8mJ87i2Y6OEbizpOCiCbD2NUqYqKAg7+Ur5suyRbcFiCQnZ
 MlSs0iQe
X-Received: by 2002:a05:690c:9988:b0:7bd:882a:43ef with SMTP id
 00721157ae682-7bfb95ae32amr56489827b3.26.1778317716282; Sat, 09 May 2026
 02:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260503045820.973718-1-zzzccc427@gmail.com>
 <2ba0b3ad-615e-43c8-a165-af631607a4c3@kernel.org>
 <CAFRLqsUirEtA4+xxVkB9B71+eaqHa+nk78HxT-eAHEW2erJBBA@mail.gmail.com>
 <d8ee4481-0d99-4ff8-b440-b6de53f21f01@kernel.org>
In-Reply-To: <d8ee4481-0d99-4ff8-b440-b6de53f21f01@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 9 May 2026 17:08:24 +0800
X-Gm-Features: AVHnY4Js6b8Awc08SpuRyI2dXpS6q1CyhWU2uSVDvJUJTn6ilrLmpjqUFdSuMek
Message-ID: <CAFRLqsVBLEQf2cp9tHBW0oQmRzc6hPorePz9Tjw-H=R+KUiRHQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2026年5月9日周六 16:51写道： > > Cen, can
    you please add all below details into v3? > > Thanks, > Sure, I will fold
    these details into the v3 commit message and make the early-start window
   clearer. 
 
 Content analysis details:   (2.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  1.0 HK_RANDOM_FROM         From username looks random
  1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [zzzccc427(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [zzzccc427(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.179 listed in wl.mailspike.net]
X-Headers-End: 1wLdfz-0008Gj-4Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: start discard thread after mount
 recovery
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
Cc: baijiaju1990@gmail.com, jaegeuk@kernel.org, quic_stummala@quicinc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 340A84FEEC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:baijiaju1990@gmail.com,m:jaegeuk@kernel.org,m:quic_stummala@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI25bm0NeaciDnml6Xlkajlha0gMTY6NTHl
hpnpgZPvvJoKCj4KPiBDZW4sIGNhbiB5b3UgcGxlYXNlIGFkZCBhbGwgYmVsb3cgZGV0YWlscyBp
bnRvIHYzPwo+Cj4gVGhhbmtzLAo+CgpTdXJlLCBJIHdpbGwgZm9sZCB0aGVzZSBkZXRhaWxzIGlu
dG8gdGhlIHYzIGNvbW1pdCBtZXNzYWdlIGFuZCBtYWtlCnRoZSBlYXJseS1zdGFydCB3aW5kb3cg
Y2xlYXJlci4KClRoYW5rcywKQ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
