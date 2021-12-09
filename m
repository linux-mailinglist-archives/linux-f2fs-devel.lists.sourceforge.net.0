Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3F46E923
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Dec 2021 14:30:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvJUr-0005Nb-Ic; Thu, 09 Dec 2021 13:30:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <antsub@gmail.com>) id 1mvJUq-0005NN-7a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Dec 2021 13:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWhcbdg6LMNqMjJopeQ2fiMjN15rsIi3OplqYhrTUNg=; b=R/6ghwCN/BEUVo5luHQdW0ggA+
 rKnclyAFc2K6ew4jiEl40GyqxHj+AFiS5hnYXSYzVgYXbuyCsitarjvV/fqgnU8KGaluZlxMa2x2E
 S/05wxpSFQC4eCnMmroTMVxRau59dpChT1x2rdTJILrDUJMGPIhIsf5mTYoQRmO+4OIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EWhcbdg6LMNqMjJopeQ2fiMjN15rsIi3OplqYhrTUNg=; b=A5OmAA5Of6N+TMgULGljgMVqPN
 8pNwhm4x6oczDw0rEh+G4FrdY1PfpwHPpAoyj9RsT61E+zJpM/YaFN1IseTPe+w1iMbyU90a+Mfx3
 H/hVmf84uMyZqhAS4F9tpMyoR+QHLjrtnSb4/2PXpoAzRhpiWAXJsTz4lPIzEPCAMw94=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mvJUo-00A1p5-2e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Dec 2021 13:30:05 +0000
Received: by mail-pj1-f54.google.com with SMTP id v23so4434580pjr.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Dec 2021 05:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=EWhcbdg6LMNqMjJopeQ2fiMjN15rsIi3OplqYhrTUNg=;
 b=PNT/X2tGeSYotdN9BtfsFJqFFXiSlsvBnzIAWF2MzKcH5Qx9zIc0eGzs2Lfm4wesam
 bRyUVuPLggWkyG98yytrLOmt12UcLxVajqjUwsMw9d44MhvDkgvKwwibHXImeCQ9mtka
 A93cMBuQLpRIiDlVNn3KYxfumOilkU+PnLa6tmn7JLzIavTM7tnXykbjwCM7otG8vXBC
 41EXbXGtY+n37O15gIX4tum8LpQkhsECHjgV2ZCJ6xXU613KuNbFaVtQMQwlOq8pl1R/
 PXM5lWo+zfyDeZXc5Y3Cd+i7K2IM5xnPw4kNwxyZVBhXLzZ465e9mz1pgTTdos460bUu
 xYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=EWhcbdg6LMNqMjJopeQ2fiMjN15rsIi3OplqYhrTUNg=;
 b=FPV7Wi6GK5OZpzihhCf2xLi3uygjaFklWiUghZbH2k2pjHeFDDyUixRhkLYmLYHdWg
 FM5ucKKgKcj04BRXgzUtFSPq5CzNlkjjR83ynD52X9LdmyKBv7PdO3RcjAqSGVdXuo52
 ketlVy6TzBD026mHLQ3MU5LJx417MdEGRYUf+ySEvpgg9YeNVjml3IbMC30Gd2kmv7l4
 UGaSBZaS5HKMoDdyJSiVQYhGa9us5npcYV6VN3l0IxaEV8XSuLcZBN6rnRblCXewMBRR
 HucdFQxBhH//fpoSD2cn8Ka8KiHA5gW18c2nV50UlRp/0vyz3Vi8QnlFoxebYuDRAKhf
 Irow==
X-Gm-Message-State: AOAM533f0NITV/PevXq+p5d9/+mXAggDG9WqZSYkKBlcOf1YPR1yqOKl
 1bAj7bB0EPxb7dtpsAABxrHwUF0Nhrk=
X-Google-Smtp-Source: ABdhPJxScwJwq8QfWZcguVF8T5HJH8XNqnrVRNUtlXIbk+hlqXuiDvVQCdCCPr3lPek/32Z0n+nIaA==
X-Received: by 2002:a17:90b:4b09:: with SMTP id
 lx9mr15982952pjb.100.1639056596452; 
 Thu, 09 Dec 2021 05:29:56 -0800 (PST)
Received: from shadowfax ([49.204.139.191])
 by smtp.gmail.com with ESMTPSA id lw1sm10058869pjb.38.2021.12.09.05.29.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Dec 2021 05:29:56 -0800 (PST)
Date: Thu, 9 Dec 2021 18:59:53 +0530
From: Ananth Bhaskararaman <antsub@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <A97B10E8-6D51-4137-A130-1C66D957EF36@getmailspring.com>
In-Reply-To: <Ya/VlEjA/AfUlsP8@google.com>
References: <Ya/VlEjA/AfUlsP8@google.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > You can get the block list from f2fs superblock in the
 first
 4KB. So userspace stuff like udev can read that to figure out which devices
 are in use? Does this require a change in the kernel too, to show that these
 drives are busy or in-use somehow? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [antsub[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mvJUo-00A1p5-2e
Subject: Re: [f2fs-dev] Multi device fs and udev
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
Cc: "=?utf-8?Q?linux-f2fs-devel=40lists.sourceforge.net?="
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> You can get the block list from f2fs superblock in the first 4KB.

So userspace stuff like udev can read that to figure out which devices
are in use?

Does this require a change in the kernel too, to show that these drives
are busy or in-use somehow?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
