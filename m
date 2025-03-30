Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66110A7586B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Mar 2025 04:39:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tyiZf-0005kV-IL;
	Sun, 30 Mar 2025 02:38:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1tyiZd-0005kO-Vh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Mar 2025 02:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+Id3mtmt04m3O7vxhsVu+5h1+9ZqLAMx9uUDkMvbbw=; b=Spu5E++TNefQsVEhmjB4e5Y/VC
 S/Lillk8+jC+4u2B9FKHzESwSyhhGHO5Scy3zAsdWlDS/i1KL3oUGpjOe+w1eiA19Z8O/LCfanxxR
 tgGk0Gn5k6doSF1MK/mSvVcVsiy1gq//w8EIYjPifBiIh9YTzZz5+yX3nNbFxpg0Jj88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U+Id3mtmt04m3O7vxhsVu+5h1+9ZqLAMx9uUDkMvbbw=; b=W
 KXGK3Mb+KUoX/FRyDppK7r1daTD6WbyTqUwwTgrm9ok89M3v3yC5DxHASfh/Y84Ywu36NHTpJM5IW
 o1UWcgntFIfRAv20EsI11dggNzliD/CAXWZYOueirUWJdD3QtPkXk4tlB3NV/OKBkgAVyu5D+pThn
 LvannitDzfwbxTeE=;
Received: from mail-oa1-f67.google.com ([209.85.160.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tyiZd-0005CY-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Mar 2025 02:38:57 +0000
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-2c818343646so2179012fac.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 29 Mar 2025 19:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743302326; x=1743907126; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U+Id3mtmt04m3O7vxhsVu+5h1+9ZqLAMx9uUDkMvbbw=;
 b=bgEPNgCV1qohVmgvAfCktplyvJm1ES1yFsDS/at75+x0HYICN3DdlszQ92MndJeWPf
 Id/t8oogz5Z3nZKdpouNHHrzGeou+ja7DT6FpKD69v9WQc/LJpeuyjT0JM8XUmEx9Ej2
 jxIyFTzLUqLKa+aJPz8bIVAh2EB0jR0vYHpgL3Al1mFNdawmDrQIYiPy8kifaa1FOXuW
 p2Ft66QE/RBXpp4K1cwn1v0Q8uqIcB/CXEqZcsFT7j+Ap3oSfY9fwus+72nN8UVWhQIk
 wKZmUuKsuJKE/Bgz3mc32lPGQKMJlzg3SsNRRAPPVNbNyO20N98xNu5b6vaB6aXpIOMY
 2I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743302326; x=1743907126;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U+Id3mtmt04m3O7vxhsVu+5h1+9ZqLAMx9uUDkMvbbw=;
 b=fI2gDZFTaUSqMyhO50nQCvZwtzhcN+DkDiJDCSC6xvamxQb6v89owsCWQBbqRX8pKZ
 RqoZcdG5bKsPPtGUDh63TKMIf40Z//hTF47gTE1n0DuRyxaom++rRedSrsi1laJDxZZe
 Dxwv9ak9cgq2ii4kAzrFdYuNfjEwzLD/s1n4o/5gxVdVcmJ9jWP6OG6Ou/SHAoKxrD6T
 ze+KD6/RHPUVegs7VVY0wA/S7MwWlnXjBGnw0RxO99WtbV8CiUlEKoqB4kSWaS9uOnRw
 Vq6/2oXc280WhBh1MiGBN83jePL9ICQahfaK5DdYQ2xOvLyDTP8arCjNa/j7tugXlsdf
 0+SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkeye7jljPjCelChxrBdpLfnVTH5bfmlpzaQHzUu+SaNPkrUCj6wojm9e17Kfg/NbMkrxRvIqru44Uy61Wakea@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwJMhGemaYVRYUnFei5Z1VeSpZLUiA7aceJ8HpYg9JXTZXoCAYT
 scgsKsBpqzlP7bc/jl2VIoXyZ1+Or8cuXjCEXiIMBPEkg1YPsVJ9itYU8PHjzKEC4wKNs45cSX1
 fzLO8T8lwSFVJfRhvHKDEtkM2R7IEoJ2oJSruEw==
X-Gm-Gg: ASbGnctcMCiT+F0X8Ad5igiHm+w+uDl0dE5OeLsjvH8YEYP8ew4NU/Udr0A1pUuBcgS
 YfnA8dXwDH3i7HZyx5BiWqCvP62k9Nven1QZdOb5/CTrHiFY40199rsvUCe/BjEC2X8sNYVhENV
 uJjtWKhfVH2ha+lfX6swz7M70BjUQ=
X-Google-Smtp-Source: AGHT+IHMJ07vnFsDV/lJhCLI+24787ZdObkLhZirWqbLPyRs+oENreh2cc4NSaaQRZWmMfl8dmoULlaaVJHDhoWy+aM=
X-Received: by 2002:a05:6870:b4a6:b0:2c1:b4ce:e43c with SMTP id
 586e51a60fabf-2cbcf5b53e5mr2317338fac.21.1743302326707; Sat, 29 Mar 2025
 19:38:46 -0700 (PDT)
MIME-Version: 1.0
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Sun, 30 Mar 2025 10:38:37 +0800
X-Gm-Features: AQ5f1JrI00qwDO6YfqJdSdiZle9fTkB0-O_sPchDtHDdOBwYTpuvcshevm7PsIE
Message-ID: <CAMLCH1E_cayyv6y8w=u3i+VTgnJmtw7+_K3X23=6w7jKDWbmTw@mail.gmail.com>
To: jaegeuk@kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear f2fs developers, I am writing to discuss a potential
 issue regarding the dirty_folio implementation in f2fs and its potential
 impact
 on write amplification. Currently, the f2fs implementation of dirty_folio
 within address_space_operations relies on filemap_dirty_folio. As
 filemap_dirty_folio
 marks the entire folio as dirty, this means that during dirty pa [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nzzhao.sigma[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.67 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.67 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.67 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tyiZd-0005CY-Bd
Subject: [f2fs-dev] [DISCUSSION]:f2fs:Approachs to address write
 amplification in current aops->dirty_folio
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
Cc: Matthew Wilcox <willy@infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear f2fs developers,
I am writing to discuss a potential issue regarding the dirty_folio
implementation in f2fs and its potential impact on write
amplification.

Currently, the f2fs implementation of dirty_folio within
address_space_operations relies on filemap_dirty_folio. As
filemap_dirty_folio marks the entire folio as dirty, this means that
during dirty page writeback, if only a single page within a folio has
been modified, the entire folio will still be written back to storage.
This behavior can lead to write amplification.

For f2fs, a log-structured file system, this write amplification issue
is particularly concerning. It not only degrades writeback I/O
performance but also results in more data blocks being appended to the
end of the disk, accelerating the frequency of garbage collection and
potentially shortening the lifespan of flash memory.

Unlike ext4, f2fs lacks a buffer_head-like per-block data structure.
Therefore, the block_dirty_folio approach used by ext4 to mitigate
this issue is not directly applicable to f2fs.

I have been considering potential solutions to address this. Two
approaches I've explored are:
 Either modifying the f2fs dirty page writeback function to manually
mark individual sub-pages within a folio as dirty, rather than relying
on the folio-level dirty flag.

Or utilizing the per-block dirty state tracking feature introduced in
kernel 6.6 within the iomap framework. This would involve using the
iomap_folio_state structure to track the dirty status of each block
within a folio.

I would greatly appreciate it if you could share your insights and
perspectives on this issue and the proposed solutions. Any feedback or
alternative suggestions would be highly valuable.

Best regards.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
