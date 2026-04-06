Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCaCGVra02nVnQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 18:07:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D03A5165
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 18:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKQqDO/E6mujGgwgx4SntGZkeGExYje+hNXOQVCDM3Q=; b=Oh7z2gUZnslR8fvaf81SRaKado
	Bed/sF2leN6ndB3sMJulRgngcjS+7Q/7v3XYFNqzJyh7O74TGHwvG672hVAqx8eDyPfOQA9whs3MY
	VqQKK5+a5CqugfM7bFfcEUBt7zs+8AXbgcLak0EDClhYmeyeChbPhzhYuHHDqyaZ1zgM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w9mUH-00067t-QD;
	Mon, 06 Apr 2026 16:07:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w9mU3-00065L-8v
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 16:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iGa9UjZEP5le0Vacdod2nKvpL9+//a/bfVvnVb+BLpQ=; b=bF41o+VPV/dVhmoH+6e1cA4Eu/
 Qo32VuCOLnEkAfXT7zOZpqCn1wyMly6dc5vQNmzs98+4iAkY8WdQrOgjR1lGjCbYSqCIycvpajA0p
 4E1ZSAQeTt/pLCK8qbCrwYrm0UYljlsdrK3jMa4bQkKMe2GRPL7hW0gU2OzFVD7dix5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iGa9UjZEP5le0Vacdod2nKvpL9+//a/bfVvnVb+BLpQ=; b=f690z0kO4qssZSkNU+eU8WYgqG
 /0+ZOONrdbDHtQ1CePEq3BdIQzbKyPjVKHVdiEEk7hR2CAd++DioEUUsETBQne9foelYZcxgVRKe6
 qh+3sHz7WKuKc1tEbOpGgT1MeiCThP4oPUpoP6NWnwOePf7523rxGa9Jr1qlympNh2PY=;
Received: from mail-yx1-f44.google.com ([74.125.224.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w9mU3-0005by-IJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 16:07:28 +0000
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-6500eae6d2fso3843249d50.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Apr 2026 09:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775491637; cv=none;
 d=google.com; s=arc-20240605;
 b=Yea7V56kqaNntWxQ7SGcncx5ZBCZ7cFPLUEVmyk0L9fCbFr+7rNkV7lGqQP2fAYZVu
 TEB8sb1LsxR4KS+909NBfV1GMDSCJc2k8ShKIaV4deCSZMMA1POJzUXIo2QBbqkBUTUy
 5SOaaANaJJaJ5g1I5UhxzYyHcA1ycC7TlGC5lEs6UHYdOkdPLzlQ23XPkesfPWayvQUs
 OpIpuw9Mr3XdulU4uEXJyT5IXBg6AOTVm/orurJYAUi5Y1XGz5bYEtVgnbTwHJenEUiN
 rD+svTMvCI0B/GFQtzvt3mE6aWJJ4WUy9rqj5SELfHIKJtdBZRyxB77m611xoISePsNR
 KKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iGa9UjZEP5le0Vacdod2nKvpL9+//a/bfVvnVb+BLpQ=;
 fh=ausFzTXjPy9XunzJAua378NsKVBUOHiwmwIFPTMx4RQ=;
 b=KMTuhNp9eBA4TFovTGHZCGoHz3v1qa169hp8oQoxmX1rlPFH4ufJ1XXdO9K733IWRG
 /bGd1zKsJyWGdbFCrcv9V3m0elyJI3mKeeZTUfkz27j4jFNXF61PGQvb2nJQpfTns1S/
 DMSAz9S/QtGfJOgy0fehOSsdkxTXeq3AUeJHTtX50CWn6S2HA0Wcscha2Ub4L8AdaeJs
 pH4nuB8sF+QuezF9cq1rieqAT3yj4E6p3RQprePiMcvmzhGUdLGMQYqtSK6y6Rgu3UFG
 Z+Ath5UH3ysN3uulcZgTmJD5v4/MM8NRmCe3yfUc4VoIRIqsvK+kMt/7FJwsqJaQ/e+d
 YHuw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775491637; x=1776096437; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGa9UjZEP5le0Vacdod2nKvpL9+//a/bfVvnVb+BLpQ=;
 b=ihX+iAjJPQMeOhcgqst0Ah3rtYgulmqSvyzBVDGz0P63ASyl5PZsnOXHlegsV+s0zG
 1ih2Ogr/4pF14cgMkLvgH/8jvHBJghRFEB0v9G7TwVofUvhetVHlEHESaCQLl5Rjq5+j
 X1OoX/UDXWDrUBlIkXes+5bMZIWII8zirxVe0OCiT6btdkq4m4F9ugtM/eqSgOp13tEN
 NKsyiuM2t12j6sr7vQ4hF8NI7+3j8v7v6qL4QVy9qhN43XSnusz/mvOM7XwjMONGjzqs
 7pv5R5gSXb0EadF6R73J6mOBL3g31mpYpWM5/2+l/FajPfQK2xWZOifRnxloqmYJckRK
 xH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775491637; x=1776096437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iGa9UjZEP5le0Vacdod2nKvpL9+//a/bfVvnVb+BLpQ=;
 b=HIyKUMpJfx+TIc0QZaiSd0vj61KWeQzBMaTqVG2/QBrmWRENYARWNDDqdhGoVgqTkO
 kaLFqu26xkbsAkD5TxAqLzxIay4Y+QgDRdi/goy1Tn53yJH+OzeWFrVGo06Euno4kbHU
 AkjXVflPetB9bEAH9zEFrqTFLbZFytsd259Y/68DlIYcNx+0L0EUduzouwIqzF/8NV0j
 tft3mOs2ZlkzWEDkbzjfF+PBmEV0UjcFCOL02ASjOsebvJZXuO6uYFC4qcm7FjMjKmKb
 So6zrvRQRf1GhR5rJwdTEH88Mb6f3qcmYOO9lJqMWp1CDoe4oSpKjOlxNSxFwSbk9XWo
 cN8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx8j1R9LZ+Dq/q8gQJpgQwiaQisbf+s5stRQZF9JK1Fy7snb2uOPcvYo/izEd1ahU4BZ545ko6Y4c6o6MIhIFJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzjgYGSbl2mlyATRQ3S1HgRGdx51X3sSkrKprGiVPXa6BXVPXaX
 GUu0YlE/H9T5NToneP8ShKP76dr5xNylZAE8+Ft/PfE1jdlUkbMELy+L1SxBCPaLqLppcplzs6E
 EDruiTAGfcODA8dE5jWO1aIvCj2QWM9Q=
X-Gm-Gg: AeBDieuRxJGfAtToHwIlnRMTavnWpw4pTnc7yiNv4MYaeNjeGekNC7zlL8k5V3DqJEY
 vGYlnSSeVTIXjmdVxcLL/IjTNsfb+dfhih0T/LF/0iCaMH01o6MbwDoa/nA55Sdxa/WdIY+UlTo
 oTr0L8bN5vDONq3ySjdSj871cnMiX8s+KKqbi2FUmd+74F3VW3esvSJDxbUrFoWbQ89F/VMMXhr
 o0tiib6XLYG6nGRQFDrw6HQUD4MdNRSJw9y/NiOGJ2wXWg88PhZXYu7q5kPerLuv/T/5Gk2nF1a
 le7AS2Aj29fpqWR84hReB3CoUNUQBv0tQK5AiGcJxFR1XpkKUKXz9t4jskBITHhRdhUNOJPLe2i
 04lfWJew=
X-Received: by 2002:a05:690e:4285:20b0:64e:e3df:2ed4 with SMTP id
 956f58d0204a3-6504884fc0cmr9670843d50.49.1775491636470; Mon, 06 Apr 2026
 09:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260331174326.231867-1-jaegeuk@kernel.org>
In-Reply-To: <20260331174326.231867-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 6 Apr 2026 09:07:05 -0700
X-Gm-Features: AQROBzCzRxcoicifgYjzQ3a9L7qh7evMa7k_85ybJobHNKuwOydwIYP1kW1hCVE
Message-ID: <CACOAw_xVfgonqa6tZtWv8TxWDB3pj4oM759j5VPS+3xB3FAFmQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 31,
 2026 at 10:45 AM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > The fsparam_string_empty() gives an error when mounting without
 string, since > its type is set to fsparam_flag in VFS. S [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 [74.125.224.44 listed in wl.mailspike.net]
X-Headers-End: 1w9mU3-0005by-IJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow empty mount string for
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
	NEURAL_HAM(-0.00)[-0.993];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A25D03A5165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYgYXQgMTA6NDXigK9BTSBKYWVnZXVrIEtpbSB2aWEgTGludXgt
ZjJmcy1kZXZlbAo8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3Rl
Ogo+Cj4gVGhlIGZzcGFyYW1fc3RyaW5nX2VtcHR5KCkgZ2l2ZXMgYW4gZXJyb3Igd2hlbiBtb3Vu
dGluZyB3aXRob3V0IHN0cmluZywgc2luY2UKPiBpdHMgdHlwZSBpcyBzZXQgdG8gZnNwYXJhbV9m
bGFnIGluIFZGUy4gU28sIGxldCdzIGFsbG93IHRoZSBmbGFnIGFzIHdlbGwuCj4KPiBUaGlzIGFk
ZHJlc3NlcyB4ZnN0ZXN0cy9mMmZzLzAxNSBhbmQgZjJmcy8wMjEuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL3N1cGVy
LmMgfCAyNyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4IDUzMzBlZjk4MTM0MC4uYWFiNDM0NWYz
ZWU3IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+IEBAIC0zMzcsOSArMzM3LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZnNfcGFyYW1ldGVy
X3NwZWMgZjJmc19wYXJhbV9zcGVjc1tdID0gewo+ICAgICAgICAgZnNwYXJhbV9mbGFnKCJ1c3Jx
dW90YSIsIE9wdF91c3JxdW90YSksCj4gICAgICAgICBmc3BhcmFtX2ZsYWcoImdycHF1b3RhIiwg
T3B0X2dycHF1b3RhKSwKPiAgICAgICAgIGZzcGFyYW1fZmxhZygicHJqcXVvdGEiLCBPcHRfcHJq
cXVvdGEpLAo+IC0gICAgICAgZnNwYXJhbV9zdHJpbmdfZW1wdHkoInVzcmpxdW90YSIsIE9wdF91
c3JqcXVvdGEpLAo+IC0gICAgICAgZnNwYXJhbV9zdHJpbmdfZW1wdHkoImdycGpxdW90YSIsIE9w
dF9ncnBqcXVvdGEpLAo+IC0gICAgICAgZnNwYXJhbV9zdHJpbmdfZW1wdHkoInByampxdW90YSIs
IE9wdF9wcmpqcXVvdGEpLAo+ICsgICAgICAgZnNwYXJhbV9zdHJpbmcoInVzcmpxdW90YSIsIE9w
dF91c3JqcXVvdGEpLAo+ICsgICAgICAgZnNwYXJhbV9mbGFnKCJ1c3JqcXVvdGEiLCBPcHRfdXNy
anF1b3RhKSwKPiArICAgICAgIGZzcGFyYW1fc3RyaW5nKCJncnBqcXVvdGEiLCBPcHRfZ3JwanF1
b3RhKSwKPiArICAgICAgIGZzcGFyYW1fZmxhZygiZ3JwanF1b3RhIiwgT3B0X2dycGpxdW90YSks
Cj4gKyAgICAgICBmc3BhcmFtX3N0cmluZygicHJqanF1b3RhIiwgT3B0X3ByampxdW90YSksCj4g
KyAgICAgICBmc3BhcmFtX2ZsYWcoInByampxdW90YSIsIE9wdF9wcmpqcXVvdGEpLAo+ICAgICAg
ICAgZnNwYXJhbV9mbGFnKCJuYXRfYml0cyIsIE9wdF9uYXRfYml0cyksCj4gICAgICAgICBmc3Bh
cmFtX2VudW0oImpxZm10IiwgT3B0X2pxZm10LCBmMmZzX3BhcmFtX2pxZm10KSwKPiAgICAgICAg
IGZzcGFyYW1fZW51bSgiYWxsb2NfbW9kZSIsIE9wdF9hbGxvYywgZjJmc19wYXJhbV9hbGxvY19t
b2RlKSwKPiBAQCAtOTgwLDI2ICs5ODMsMjYgQEAgc3RhdGljIGludCBmMmZzX3BhcnNlX3BhcmFt
KHN0cnVjdCBmc19jb250ZXh0ICpmYywgc3RydWN0IGZzX3BhcmFtZXRlciAqcGFyYW0pCj4gICAg
ICAgICAgICAgICAgIGN0eF9zZXRfb3B0KGN0eCwgRjJGU19NT1VOVF9QUkpRVU9UQSk7Cj4gICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBPcHRfdXNyanF1b3RhOgo+IC0gICAg
ICAgICAgICAgICBpZiAoISpwYXJhbS0+c3RyaW5nKQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IGYyZnNfdW5ub3RlX3FmX25hbWUoZmMsIFVTUlFVT1RBKTsKPiAtICAgICAgICAgICAg
ICAgZWxzZQo+ICsgICAgICAgICAgICAgICBpZiAocGFyYW0tPnR5cGUgPT0gZnNfdmFsdWVfaXNf
c3RyaW5nICYmICpwYXJhbS0+c3RyaW5nKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IGYyZnNfbm90ZV9xZl9uYW1lKGZjLCBVU1JRVU9UQSwgcGFyYW0pOwo+ICsgICAgICAgICAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZjJmc191bm5vdGVfcWZfbmFt
ZShmYywgVVNSUVVPVEEpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgY2FzZSBPcHRfZ3JwanF1b3RhOgo+IC0gICAgICAgICAgICAgICBpZiAoISpwYXJhbS0+c3Ry
aW5nKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGYyZnNfdW5ub3RlX3FmX25hbWUo
ZmMsIEdSUFFVT1RBKTsKPiAtICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBp
ZiAocGFyYW0tPnR5cGUgPT0gZnNfdmFsdWVfaXNfc3RyaW5nICYmICpwYXJhbS0+c3RyaW5nKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGYyZnNfbm90ZV9xZl9uYW1lKGZjLCBHUlBR
VU9UQSwgcGFyYW0pOwo+ICsgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gZjJmc191bm5vdGVfcWZfbmFtZShmYywgR1JQUVVPVEEpOwo+ICAgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBPcHRfcHJqanF1b3RhOgo+IC0g
ICAgICAgICAgICAgICBpZiAoISpwYXJhbS0+c3RyaW5nKQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IGYyZnNfdW5ub3RlX3FmX25hbWUoZmMsIFBSSlFVT1RBKTsKPiAtICAgICAgICAg
ICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBpZiAocGFyYW0tPnR5cGUgPT0gZnNfdmFsdWVf
aXNfc3RyaW5nICYmICpwYXJhbS0+c3RyaW5nKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IGYyZnNfbm90ZV9xZl9uYW1lKGZjLCBQUkpRVU9UQSwgcGFyYW0pOwo+ICsgICAgICAgICAg
ICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZjJmc191bm5vdGVfcWZf
bmFtZShmYywgUFJKUVVPVEEpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+IC0t
Cj4gMi41My4wLjExMTguZ2FlZjU4ODExMDktZ29vZwo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVv
bmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
