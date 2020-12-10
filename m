Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A59412D5FAE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 16:29:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knNsh-0000Ey-8R; Thu, 10 Dec 2020 15:29:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jordan@getseam.com>) id 1knNqj-0008R2-Qq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 15:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:In-Reply-To:To:References:Date:Subject:
 Mime-Version:Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOz6p6X25DOvOiWn0zXsqPe2L3UFPbP/+/Gj9m/b50c=; b=MAcJiV6V1Yjt5okox9NpBUwvIG
 A8NeBDxi0pZb00tpiKplKBfKs3X+FS01TYrBdBK5dPbWEMolqnnqkbRRjoYrvZVLrkik7VyHJWBFf
 XYxgfUwWdbU19N3iysI01pFXtmC+T3eZtNlXbGrDd65y8vvtefqzXlagf0DTw9xZjy3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:In-Reply-To:To:References:Date:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oOz6p6X25DOvOiWn0zXsqPe2L3UFPbP/+/Gj9m/b50c=; b=Qd0oSF+YuvhyHjD0Z+ZL1nruv3
 oaggzioHl2GcV+1dn1NP38qmqU9/BdMW0p9rSMY+06pFKhCcBtr4y26dim6V2MZrYKf75pwCJTXn7
 8eXzn5ExQProzciVk5NBTGzd/E8RDtQLcIBYrkb+8kUqnDXTd73OEAYM5zg9dAeMFrHQ=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1knNqa-0093k9-8p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 15:27:21 +0000
Received: by mail-io1-f68.google.com with SMTP id i9so5902423ioo.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Dec 2020 07:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getseam-com.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=oOz6p6X25DOvOiWn0zXsqPe2L3UFPbP/+/Gj9m/b50c=;
 b=HclfKDqlGBq1730yl0Gcvg6ElPcPC6k0XM2b7F1NSN1wxN8qmTqnLs6eKCs9VSE3GK
 JXLhR7HcTaTZBmuaJSHuRrTPQt+2cRDeznD8krUAKHsR4oPt55wwO3RubxeXcdntD6e2
 YTirlcomLbSz8HEAH1CBjVKHBiTUZlXnRO9TAMCrq7NvgiUBXZJf896tzyA1FvPxbg1h
 /SxBzOrBtP2Z5F6/u+7Ye6LG3uL1qsz2Q2hWnDsOgNr/mjZyDeTJLlltqckGWBknlw6Z
 bAzcwhPLwgMU4pQLwzHAO43pKQZnamzwAlDPuKRCSC6VWd/YktpTimcsbMFGgPGe17rl
 WQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=oOz6p6X25DOvOiWn0zXsqPe2L3UFPbP/+/Gj9m/b50c=;
 b=PlPZ4Clv0ZqUd+D3sqeHO0CQAEbMAeFiX9EMCtbVsdSyFM6UsChAqUVIgWwa7LPO4D
 7aZIFWGCnUzgFkM0evoDXQpsWtBloAxpVtdrLWRwSwt+5pd8PYxVB9y+CJRmkbriqa4o
 2jbYCCiPiyu4RNugF24PyqaN50foQoZHzIy5VtD1nJI3WFvnlQUH/kO0r0NVJVtDpigI
 FU+2uVKbJCyYI1/WHkQLWgVP8xRzLFHv10BdhuNHCXSffiRmWTYJm1rrUeqc9Zs1NzUZ
 0ar1dsaeF/GDdBFlhOpPW5OBT9opGV9/w8pliaBjOLXq4XPkq0H9JjrMs0FNAE+228MZ
 SA9g==
X-Gm-Message-State: AOAM533Mj3zGZO1fOPutGFFDfkxI5kMTo3non4kNv12aDTerEAf5La+o
 KpGhQ67taDkNV72h28Gkqj2pcaBsCwrlQdhZ
X-Google-Smtp-Source: ABdhPJzaVg3MV6ErMCPoyitQdRO1fDPJP5a/71aUC2EZQgk4U7xexCQmTgTo2SNusYi8txoxmB13Ww==
X-Received: by 2002:a05:6602:93:: with SMTP id
 h19mr8618127iob.59.1607612726348; 
 Thu, 10 Dec 2020 07:05:26 -0800 (PST)
Received: from dorothy.webb.haus ([24.148.31.157])
 by smtp.gmail.com with ESMTPSA id y13sm2758645iop.14.2020.12.10.07.05.25
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 07:05:25 -0800 (PST)
From: Jordan Webb <jordan@getseam.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Date: Thu, 10 Dec 2020 09:05:24 -0600
References: <0D95EC1F-D44F-4AB4-BE2B-77A88E0FAFE3@getseam.com>
 <X9GDS0ujfVrTmYnw@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
In-Reply-To: <X9GDS0ujfVrTmYnw@google.com>
Message-Id: <AC1E3312-8B46-4948-9F9F-58DE9F592951@getseam.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1knNqa-0093k9-8p
Subject: Re: [f2fs-dev] [PATCH] Make sload.f2fs reproduce hard links
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBUaGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIHBhdGNoLgo+IEkndmUgdHJpZWQgYSBiaXQgd2l0
aCByZWNlbnQgY29tcHJlc3Npb24gc3VwcG9ydCBmb3Igc2xvYWQuZjJmcywgYW5kIGZvdW5kIGFu
Cj4gaXNzdWUgd2hlcmUgaXQgYnJlYWtzIGlfYmxvY2tzIGR1ZSB0byBidWlsZGluZyBkYXRhIGNv
bnRlbnRzIHR3aWNlIG9uIGhhcmRsaW5rCj4gZmlsZS4gSSB3cm90ZSBhIHBhdGNoIHRvIGFkZHJl
c3MgaXQgbGlrZSB0aGlzLCBzbyBjb3VsZCB5b3UgcGxlYXNlIGNoZWNrIGl0PwoKVGhhbmsgeW91
IGZvciByZXZpZXdpbmchIEkganVzdCByZWFsaXplZCB0aGF0IEkgbWlzc2VkIHRoZSBleGlzdGVu
Y2Ugb2YgdGhlIArigJxkZXbigJ0gYnJhbmNoLCBteSBwYXRjaCBpcyBvZmYgb2Yg4oCcbWFzdGVy
4oCdIC0gSSB3aWxsIHNlbmQgYSB2MiByZWJhc2VkIG9mZiBvZgrigJxkZXbigJ0gd2l0aCB5b3Vy
IGZpeGVzIGludGVncmF0ZWQgbGF0ZXIgdG9kYXkuCgrigJQKSm9yZGFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
