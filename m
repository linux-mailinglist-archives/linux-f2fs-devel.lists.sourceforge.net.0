Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16593AEE7D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 21:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7EHfjjqcvrGskRdb8zR775aoJfY72jissjt4rh9zgA=; b=Lr9LnpUUi7cSgHyBnscZYzr1QJ
	cKq4frdU9kYfiqFz4uFj1WPVAO0W/HkGaXsB8AQFdtSgAA8K8S0TO5Q8WKAWDvkD3GsdcJSCLLdji
	szPio751A1bcaLCjhXkzl3gvN0hbTEn9Q/8x4wXaI2A4EWcwg2AIAFfjV7ig2y31RHrk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWKeQ-0008Rl-Lr;
	Mon, 30 Jun 2025 19:58:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jprusakowski@google.com>) id 1uWKeP-0008Rc-EG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 19:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2bRRRZ1lp9+0IPVpxNj7sf43IQvUm3WYy/Y3w0RGmak=; b=UdA2FQkXxkTBs/ZBTN5goBGfQM
 8/Cgr3z9hN/BkY2smAc06RhBinoq3ICiAxfnf/zaZpZPWkmLlEPi4GuZBKkAZnDxlYLbe/wBn1wCK
 TIRxmu/kdGYMEqc8E2egdEWk2a0P15nVI67CgBLT9OslfMSvEqv/Q7Fr+DoCDJBJnOdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2bRRRZ1lp9+0IPVpxNj7sf43IQvUm3WYy/Y3w0RGmak=; b=KLDA1Rb9zyzL0LpHHVWZM98dlS
 R68Ao1LY4vT5glBrKeP64uwuRud1zrQG4WSKjYe0/t4uBsebBui3gATwQ+TXmX2R6Z2BE9prPJWSY
 QuNNI4G3ZO/np1XH4NXjT6F9EBc4hc79UHD+S0Z8yR9ab34MBEQ4lZIpccRGS/6/+GMY=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uWKeP-0003Wq-45 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 19:58:49 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60b86fc4b47so271a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jun 2025 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751313522; x=1751918322;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bRRRZ1lp9+0IPVpxNj7sf43IQvUm3WYy/Y3w0RGmak=;
 b=nKLeqAelqutro/xeyrz1KDmfrO5d/qeSRPkDon7wjyHzJUJKWeqQzGbxwy6sKEK20q
 XC03GuH1JBi7Nn5JyidLUTa6l+wy+fUg+eyuTs1fzF6MOr6BqFN+vFcE3zpxCwR9gzhb
 yfSNMYe+CW8sM38i8qlvmic2C0YnAKXlvar7Fo3rOoFXXGcH8y88HxkfFw9kMhVMf1Pm
 stE7CTlsUPnMP0rXOFtPWXhKez9j3LjAJsAeWOW6M8Vk7rE+6U4U4b9M1AKBOpliJHlq
 gCgfsXEg0Y7BhCNgOeLa5WaHEkLt108hrm7J2/akIgnaf5WsdK6Pyq4lcgt4VMRA1X0Z
 YY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751313522; x=1751918322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bRRRZ1lp9+0IPVpxNj7sf43IQvUm3WYy/Y3w0RGmak=;
 b=ObEe59Jzw46pVOA57L5TUwQ+qDFN5vcmdTHxvC2qJsGzttB+PVBV9cwQg2S+yGcwpH
 MuqyIJki3qnW6qUR3lxM74h9UwTgPJb9Woj5sI3oHuLdNELaFY1Pe/ft8ZezvmTIFW5J
 9CLHY8PoPNSTwBvkM6Oki+7/68sLuaoUg/cc/mCGdH0L9dfPfaKCCGEC1TGvSFk09/TE
 BF4MoPKwajrT4H8XGtzrJHpdzl4POCLcruVjpSanBqwVQvVypyC1hQf4rCQQeB7GYbso
 QZ6IjBoZYeOvL8NI7zwKh9+KBhY3xGS6g9LYiNB8bSHdNnmY3wRL48lQVa5EuEXAPcvh
 GGSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXREXwOIItDeST8RiYWgwj1xnht7kI1QOR9l2o+AXyC9ut8Dt0AaVd3fNEqlcuulfObFkE8kBP6p+AC8YCqSmfD@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz/AXSIRhxEOJLEvI7dT7Q5h4RRLjIThD1bx132zMRNUUbjdfXJ
 DMqnguv4RiJ3rxSWHvB7mAEm5APXRg2rotc9Cn3GMNDRTLpb+pqYSjOvgBfTedXn2TJFHvrTN1l
 q7UMgbl62/cjJTgw6IEg0aASo9M8Ry2OvP9YyWM4U
X-Gm-Gg: ASbGncvHCLjXknCLQW0ShCV2AkXu4oMOQFnnEypfaP/dBXklN3l4mfXRHy0PMcBeeB9
 QrrHUsd1T+UH7zAMf2H+DKjsgApTBUT7DayTPr9rPABwMzjCsGEjyQrdax/I+x3hj0jXAEtlg23
 qxJjxIQZbaPxBlksFOEfZVToK2gLchn6Wwp8hVgDeFmQ==
X-Google-Smtp-Source: AGHT+IFZ5lHZOcOigJkjUG++4rwBcWPdV6xQNKDJ6iwEA2oDTgaw3v7Wu+bXd4VrjH5VXCxnJPZwDCghzRaR3ZIciU4=
X-Received: by 2002:a05:6402:17d5:b0:609:99a7:efdb with SMTP id
 4fb4d7f45d1cf-60e33326819mr14649a12.2.1751313521898; Mon, 30 Jun 2025
 12:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250620082906.2122560-1-jprusakowski@google.com>
 <20250620142825.hczg4ldsk46delze@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
In-Reply-To: <20250620142825.hczg4ldsk46delze@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Date: Mon, 30 Jun 2025 21:58:30 +0200
X-Gm-Features: Ac12FXx05NxpsjifcoA6eInw7PBfzkMDGedAW-Wuny4Tfpta1YfZQChx-KIS7ns
Message-ID: <CAHwWncjjZdcXDBmKH-Hm8vL2MW_9rHjr6_fPMxwhUAkmjiuNHw@mail.gmail.com>
To: Zorro Lang <zlang@redhat.com>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 20, 2025 at 4:28 PM Zorro Lang <zlang@redhat.com>
 wrote: > > I saw you used _require_no_compress in your patch, but this function
 only supports > btrfs checking currently. How do you avoid [...] 
 Content analysis details:   (-7.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.208.42 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
X-Headers-End: 1uWKeP-0003Wq-45
Subject: Re: [f2fs-dev] [PATCH v1 0/1] generic/018: do not run the test if a
 compressed filesystem is used
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgNDoyOOKAr1BNIFpvcnJvIExhbmcgPHpsYW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gSSBzYXcgeW91IHVzZWQgX3JlcXVpcmVfbm9fY29tcHJlc3MgaW4g
eW91ciBwYXRjaCwgYnV0IHRoaXMgZnVuY3Rpb24gb25seSBzdXBwb3J0cwo+IGJ0cmZzIGNoZWNr
aW5nIGN1cnJlbnRseS4gSG93IGRvIHlvdSBhdm9pZCB5b3VyIHRlc3QgZmFpbHVyZSBvbiBGMkZT
PwoKSGkgWm9ycm8sCgpZb3UncmUgcmlnaHQgLSB0aGF0IHBhdGNoIHdvbid0IHdvcmsgYXMgSSBp
bnRlbmRlZC4gVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUKdG8gcmV2aWV3IGl0LiBXZSd2ZSBk
b25lIHNvbWUgbW9yZSBjaGVja3MgYW5kIGl0IGxvb2tzIGxpa2Ugb3VyIGluaXRpYWwKc3VzcGlj
aW9uIHdhcyB3cm9uZyBhbmQgd2UnbGwgbmVlZCBhIGtlcm5lbCBmaXggdG8gYWRkcmVzcyB0aGUg
cHJvYmxlbXMgd2l0aCB0aGUKdGVzdC4KClRoYW5rcyBhZ2FpbiEKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
