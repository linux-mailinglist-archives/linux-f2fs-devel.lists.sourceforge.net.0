Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70455AFDB79
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 01:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDg2t0q7vgL0n/mxWjoqQ4ImJIRiQYEVQ5qybOUvNos=; b=cL//1pSTTtNEjpZyDW6gH8zTg3
	JAWK3M9Rs/8e6HrJoIE3IAKQ9iSI3ezEMgu0bxni7CC2zkWiPK06MMC+p7yGDUe6NC1IfWx9ysDP4
	XxZcY3StOWFqIiROJk6RC56h58hiMivC9MU9GtC24t5tJkz6r0PRzitzHNT5YsTkuwdM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZHI5-00056z-J7;
	Tue, 08 Jul 2025 22:59:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1uZHI4-00056t-RY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 22:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s3l35aQqAnevtjyZ/VyVsw6OhRX5o5OHMyl6xIvwp38=; b=LFrw3/oGaVc+uin2svKxxpkaz3
 YkZ7f9o+Vs4NcvjDhdXhwgu096TxfAW9B+Fr+Zp8T3GRExDhv5aRZynrsnvEdCvVftSz10NddPiAW
 +wBUHSk4W0HIt3YGOrxnB2Qoo07Pbxfuq64AIuAhHBFHXRXo1iylKT8sT+XBosyuor9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s3l35aQqAnevtjyZ/VyVsw6OhRX5o5OHMyl6xIvwp38=; b=CjIr0VAd6UDLqpvxFKUW9xLltS
 RWs5CtQ2qkcUYsxyFaPxFCLzBaRvsj6MpZfFd16x4JK1u11ZznV3dwFeysjCURfe4BqTZCn8d8CmS
 XGqQuZ6moUZrDx/hVv8YibJyn931vA5wcwbcMAxr8W0/IXYPsIWXfe3Wa7gOc0T8wcWs=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uZHI4-0007SI-1G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 22:59:56 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso44903515ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Jul 2025 15:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1752015585; x=1752620385;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s3l35aQqAnevtjyZ/VyVsw6OhRX5o5OHMyl6xIvwp38=;
 b=EfXeUtrwb9YqMBgUYM9haNdDC1wF/6mrK838fe7kF63AfXnl3Q3DnpSPY23Yhq9Q3x
 4AsXPKPBxGG81+zIyKNTxxUhontCPce3RDg1mv+2hEV4e4DzXzohkqF572pqlgTLg19y
 qQBHx1rj012fowRU0QLRh75s0i6fJq6p01Mr92QM1rphuDWNTYBEC1Xh5IY2e7rsh3jV
 nwoacT9LrB6fJ/KCIl5a7zFJwI9FYrSMSzs/5bEw5wws936mhIKn6vHszK3wfPSNLAHq
 bFDa61sqNMpboM0XqLieTuAnzM32KFBxNd8lrAW5xQYKHRDvdTecIQQBL1R6rfccMOjp
 +utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752015585; x=1752620385;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s3l35aQqAnevtjyZ/VyVsw6OhRX5o5OHMyl6xIvwp38=;
 b=AySZ/IfFrrjqZan+WyJwiMg9t5fVc5H814DrvTydFWo6KaagZemRqST2mtWQqsIsIl
 h61d5xFK8RwNTurSDhTgm31N5h7tSyeUCe6iUeZYxZN4EeGQHe2o9Tr1JRGsr/n9xM0J
 lvv3QwtT8mpDCtNZTYnMVNPcnKpLgX6lG/yDYxUAafCHtQfMnoD9gFhkkxlB1RTfH3Fz
 Mn9fAScWrtTm3YxvsM1JzGTbebxqUhdcL8Dep+bseSg79iN15f9RgTH36K6RGxgT6XA0
 XrK2yi2njwUfXFYDjJTFXvysjq3bXd/QiIzabpJt0VQap0v92MqPtl4tpuHekoGLMK+z
 kqvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeyeQKsDEq7Z9DmdJH6nWvLDqUDNoF+9CGs7yY0TM5sMMo0oHVMTHEWPRXlJIxq87GDH1KzyJzFOKNucC5bGaE@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy1x+zivVMIxbQh2QDxW1H3Gs+SUQDal41WVQqmwJ3pVwt8S6Ay
 4eyTL2xbc174L87CJoYnxPttLhcJw5UnYObyYBuZXwgJPNZKKdz/L82hiM/wjdgXE/M=
X-Gm-Gg: ASbGncuwK5rmnOb7Rv24vBYk5fqjg8Vq+fYfc8jiiWY108BVp+W/pn7tsaG1BgKRY7g
 MlbrVxULwC341FQIWbmJG4YF4+GoGr2yNpSHgwjBM1giUShhgcYJ2YrS4ZSncFrIZs0X8GZrH2E
 CdCOtIS0SAE5D61B4LqRav2Piwte93xHZ5PvERYUNrHn7cJW6EakPcXI7a4YwqUIB1PvxC7gtTU
 G3/kyoqBnZH23bOwsNBIHaBoejgc43z0FzKHYfb8FJgMJFfo+JyAhOhCS+v7rqOQoH0iZvYMN67
 e5ASkk3vAaBsSu/bVvDfjGLjhZzPLqSpIlkxXr5fVplWmsOgo0hIOMzq6bxzd6Yq4N+IDFyYDCx
 APANcZwrijruKpBLlkPK1dv+EF/KvA56STvDmGw==
X-Google-Smtp-Source: AGHT+IHgAio6dtY7YujZnCX74Dqj6rWXG+QIi1+TToEKN6tFwVYNcRTRFvNMZWDi8G3LmTON1cFJ/Q==
X-Received: by 2002:a17:903:2411:b0:223:7006:4db2 with SMTP id
 d9443c01a7336-23ddb2e62cfmr4398715ad.31.1752015585353; 
 Tue, 08 Jul 2025 15:59:45 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455eea0sm121499985ad.137.2025.07.08.15.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 15:59:44 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uZHHq-00000008cJE-0C8v;
 Wed, 09 Jul 2025 08:59:42 +1000
Date: Wed, 9 Jul 2025 08:59:42 +1000
To: Christian Brauner <brauner@kernel.org>
Message-ID: <aG2i3qP01m-vmFVE@dread.disaster.area>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 08, 2025 at 09:55:14AM +0200, Christian Brauner
 wrote: > On Mon, Jul 07, 2025 at 05:45:32PM -0700, Darrick J. Wong wrote:
 > > On Tue, Jul 08, 2025 at 08:52:47AM +0930, Qu Wenruo wrote: > > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uZHI4-0007SI-1G
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: ntfs3@lists.linux.dev, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDk6NTU6MTRBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMDU6NDU6MzJQTSAtMDcwMCwgRGFy
cmljayBKLiBXb25nIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDg6NTI6NDdB
TSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+ID4gPiAKPiA+ID4gCj4gPiA+IOWcqCAyMDI1Lzcv
OCAwODozMiwgRGF2ZSBDaGlubmVyIOWGmemBkzoKPiA+ID4gPiBPbiBGcmksIEp1bCAwNCwgMjAy
NSBhdCAxMDoxMjoyOUFNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+ID4gPiBDdXJyZW50
bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBpbXBsZW1lbnRpbmcgdGhlCj4gPiA+ID4gPiBzdXBlcl9v
cGVhcmF0aW9uczo6c2h1dGRvd24oKSBjYWxsYmFjayBjYW4gbm90IGFmZm9yZCBsb3NpbmcgYSBk
ZXZpY2UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRodXMgZnNfYmRldl9tYXJrX2RlYWQoKSB3aWxs
IGp1c3QgY2FsbCB0aGUgc2h1dGRvd24oKSBjYWxsYmFjayBmb3IgdGhlCj4gPiA+ID4gPiBpbnZv
bHZlZCBmaWxlc3lzdGVtLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBCdXQgaXQgd2lsbCBubyBsb25n
ZXIgYmUgdGhlIGNhc2UsIHdpdGggbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIGxpa2UKPiA+ID4g
PiA+IGJ0cmZzIGFuZCBiY2FjaGVmcyB0aGUgZmlsZXN5c3RlbSBjYW4gaGFuZGxlIGNlcnRhaW4g
ZGV2aWNlIGxvc3Mgd2l0aG91dAo+ID4gPiA+ID4gc2h1dHRpbmcgZG93biB0aGUgd2hvbGUgZmls
ZXN5c3RlbS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVG8gYWxsb3cgdGhvc2UgbXVsdGktZGV2aWNl
IGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0ZWQgdG8gdXNlCj4gPiA+ID4gPiBmc19ob2xkZXJf
b3BzOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAtIFJlcGxhY2Ugc3VwZXJfb3BlYXJhdGlvbjo6c2h1
dGRvd24oKSB3aXRoCj4gPiA+ID4gPiAgICBzdXBlcl9vcGVhcmF0aW9uczo6cmVtb3ZlX2JkZXYo
KQo+ID4gPiA+ID4gICAgVG8gYmV0dGVyIGRlc2NyaWJlIHdoZW4gdGhlIGNhbGxiYWNrIGlzIGNh
bGxlZC4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGNvbmZsYXRlcyBjYXVzZSB3aXRoIGFjdGlvbi4K
PiA+ID4gPiAKPiA+ID4gPiBUaGUgc2h1dGRvd24gY2FsbG91dCBpcyBhbiBhY3Rpb24gdGhhdCB0
aGUgZmlsZXN5c3RlbSBtdXN0IGV4ZWN1dGUsCj4gPiA+ID4gd2hpbHN0ICJyZW1vdmUgYmRldiIg
aXMgYSBjYXVzZSBub3RpZmljYXRpb24gdGhhdCBtaWdodCByZXF1aXJlIGFuCj4gPiA+ID4gYWN0
aW9uIHRvIGJlIHRha2UuCj4gPiA+ID4gCj4gPiA+ID4gWWVzLCB0aGUgY2F1c2UgY291bGQgYmUg
c29tZW9uZSBkb2luZyBob3QtdW5wbHVnIG9mIHRoZSBibG9jawo+ID4gPiA+IGRldmljZSwgYnV0
IGl0IGNvdWxkIGFsc28gYmUgc29tZXRoaW5nIGdvaW5nIHdyb25nIGluIHNvZnR3YXJlCj4gPiA+
ID4gbGF5ZXJzIGJlbG93IHRoZSBmaWxlc3lzdGVtLiBlLmcuIGRtLXRoaW5wIGhhdmluZyBhbiB1
bnJlY292ZXJhYmxlCj4gPiA+ID4gY29ycnVwdGlvbiBvciBFTk9TUEMgZXJyb3JzLgo+ID4gPiA+
IAo+ID4gPiA+IFdlIGFscmVhZHkgaGF2ZSBhICJjYXVzZSIgbm90aWZpY2F0aW9uOiBibGtfaG9s
ZGVyX29wcy0+bWFya19kZWFkKCkuCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGdlbmVyaWMgZnMgYWN0
aW9uIHRoYXQgaXMgdGFrZW4gYnkgdGhpcyBub3RpZmljYXRpb24gaXMKPiA+ID4gPiBmc19iZGV2
X21hcmtfZGVhZCgpLiAgVGhhdCBhY3Rpb24gaXMgdG8gaW52YWxpZGF0ZSBjYWNoZXMgYW5kIHNo
dXQKPiA+ID4gPiBkb3duIHRoZSBmaWxlc3lzdGVtLgo+ID4gPiA+IAo+ID4gPiA+IGJ0cmZzIG5l
ZWRzIHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgdG8gYSBibGtfaG9sZGVyX29wcy0+bWFya19k
ZWFkCj4gPiA+ID4gbm90aWZpY2F0aW9uLiBpLmUuIGl0IG5lZWRzIGFuIGFjdGlvbiB0aGF0IGlz
IGRpZmZlcmVudCB0bwo+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFkKCkuCj4gPiA+ID4gCj4gPiA+
ID4gSW5kZWVkLCB0aGlzIGlzIGhvdyBiY2FjaGVmcyBhbHJlYWR5IGhhbmRsZXMgInNpbmdsZSBk
ZXZpY2UKPiA+ID4gPiBkaWVkIiBldmVudHMgZm9yIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyAt
IHNlZQo+ID4gPiA+IGJjaDJfZnNfYmRldl9tYXJrX2RlYWQoKS4KPiA+ID4gCj4gPiA+IEkgZG8g
bm90IHRoaW5rIGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBlc3BlY2lhbGx5IHdoZW4gdGhl
cmUgaXMgYWxyZWFkeQo+ID4gPiBmc19ob2xkZXJfb3BzLgo+ID4gPiAKPiA+ID4gV2UncmUgYWx3
YXlzIGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRoYW4gbGV0
dGluZyB0aGUKPiA+ID4gaW5kaXZpZHVhbCBmcyB0byBkbyB0aGUgc2FtZSB0aGluZyBzbGlnaHRs
eSBkaWZmZXJlbnRseS4KPiA+IAo+ID4gT24gc2Vjb25kIHRob3VnaHQgLS0gaXQncyB3ZWlyZCB0
aGF0IHlvdSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+ID4gc2hyaW5rIHRoZSBpbm9kZS9k
ZW50cnkgY2FjaGVzIGluIGEgInlvdXIgZGV2aWNlIHdlbnQgYXdheSIgaGFuZGxlci4KPiA+IEZh
bmN5IGZpbGVzeXN0ZW1zIGxpa2UgYmNhY2hlZnMgYW5kIGJ0cmZzIHdvdWxkIGxpa2VseSBqdXN0
IHNoaWZ0IElPIHRvCj4gPiBhIGRpZmZlcmVudCBiZGV2LCByaWdodD8gIEFuZCB0aGVyZSdzIG5v
IGdvb2QgcmVhc29uIHRvIHJ1biBzaHJpbmtlcnMgb24KPiA+IGVpdGhlciBvZiB0aG9zZSBmc2Vz
LCByaWdodD8KPiA+IAo+ID4gPiBZZXMsIHRoZSBuYW1pbmcgaXMgbm90IHBlcmZlY3QgYW5kIG1p
eGluZyBjYXVzZSBhbmQgYWN0aW9uLCBidXQgdGhlIGVuZAo+ID4gPiByZXN1bHQgaXMgc3RpbGwg
YSBtb3JlIGdlbmVyaWMgYW5kIGxlc3MgZHVwbGljYXRlZCBjb2RlIGJhc2UuCj4gPiAKPiA+IEkg
dGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBnb29kIHBvaW50IHRoYXQgaWYgeW91ciBmaWxlc3lzdGVt
IGNhbiBkbwo+ID4gc29tZXRoaW5nIGNsZXZlciBvbiBkZXZpY2UgcmVtb3ZhbCwgaXQgc2hvdWxk
IHByb3ZpZGUgaXRzIG93biBibG9jawo+ID4gZGV2aWNlIGhvbGRlciBvcHMgaW5zdGVhZCBvZiB1
c2luZyBmc19ob2xkZXJfb3BzLiAgSSBkb24ndCB1bmRlcnN0YW5kCj4gPiB3aHkgeW91IG5lZWQg
YSAiZ2VuZXJpYyIgc29sdXRpb24gZm9yIGJ0cmZzIHdoZW4gaXQncyBub3QgZ29pbmcgdG8gZG8K
PiA+IHdoYXQgdGhlIG90aGVycyBkbyBhbnl3YXkuCj4gCj4gSSB0aGluayBsZXR0aW5nIGZpbGVz
eXN0ZW1zIGltcGxlbWVudCB0aGVpciBvd24gaG9sZGVyIG9wcyBzaG91bGQgYmUKPiBhdm9pZGVk
IGlmIHdlIGNhbi4gQ2hyaXN0b3BoIG1heSBjaGltZSBpbiBoZXJlLiBJIGhhdmUgbm8gYXBwZXR0
aXRlIGZvcgo+IGV4cG9ydGluZyBzdHVmZiBsaWtlIGdldF9iZGV2X3N1cGVyKCkgdW5sZXNzIGFi
c29sdXRlbHkgbmVjZXNzYXJ5LiBXZQo+IHRyaWVkIHRvIG1vdmUgYWxsIHRoYXQgaGFuZGxpbmcg
aW50byB0aGUgVkZTIHRvIGVsaW1pbmF0ZSBhIHNsZXcgb2YKPiBkZWFkbG9ja3Mgd2UgZGV0ZWN0
ZWQgYW5kIGZpeGVkLiBJIGhhdmUgbm8gYXBwZXRpdGUgdG8gcmVwZWF0IHRoYXQKPiBjeWNsZS4K
CkV4Y2VwdCBpdCBpc24ndCBhY3R1YWxseSBuZWNlc3NhcnkuCgpFdmVyeW9uZSBoZXJlIHNlZW1z
IHRvIGJlIGFzc3VtaW5nIHRoYXQgdGhlIGZpbGVzeXN0ZW0gKm11c3QqIHRha2UKYW4gYWN0aXZl
IHN1cGVyYmxvY2sgcmVmZXJlbmNlIHRvIHByb2Nlc3MgYSBkZXZpY2UgcmVtb3ZhbCBldmVudCwK
YW5kIHRoYXQgaXMgKnNpbXBseSBub3QgdHJ1ZSouCgpiY2FjaGVmcyBkb2VzIG5vdCB1c2UgZ2V0
X2JkZXZfc3VwZXIoKSBvciBhbiBhY3RpdmUgc3VwZXJibG9jawpyZWZlcmVuY2UgdG8gcHJvY2Vz
cyAtPm1hcmtfZGVhZCBldmVudHMuCgpJdCBoYXMgaXQncyBvd24gaW50ZXJuYWwgcmVmZXJlbmNl
IGNvdW50aW5nIG9uIHRoZSBzdHJ1Y3QgYmNoX2ZzCmF0dGFjaGVkIHRvIHRoZSBiZGV2IHRoYXQg
ZW5zdXJlcyB0aGUgZmlsZXN5c3RlbSBzdHJ1Y3R1cmVzIGNhbid0IGdvCmF3YXkgd2hpbHN0IC0+
bWFya19kZWFkIGlzIGJlaW5nIHByb2Nlc3NlZC4gIGkuZS4gYmNhY2hlZnMgaXMgb25seQpkZXBl
bmRlbnQgb24gdGhlIGJkZXYtPmJkX2hvbGRlcl9sb2NrKCkgYmVpbmcgaGVsZCB3aGVuCi0+bWFy
a19kZWFkKCkgaXMgY2FsbGVkIGFuZCBkb2VzIG5vdCByZWx5IG9uIHRoZSBWRlMgZm9yIGFueXRo
aW5nLgoKVGhpcyBtZWFucyB0aGF0IGRldmljZSByZW1vdmFsIHByb2Nlc3NpbmcgY2FuIGJlIHBl
cmZvcm1lZAp3aXRob3V0IGdsb2JhbCBmaWxlc3lzdGVtL1ZGUyBsb2NrcyBuZWVkaW5nIHRvIGJl
IGhlbGQuIEhlbmNlIGlzc3VlcwpsaWtlIHJlLWVudHJhbmN5IGRlYWRsb2NrcyB3aGVuIHRoZXJl
IGFyZSBjb25jdXJyZW50L2Nhc2NhZGluZwpkZXZpY2UgZmFpbHVyZXMgKGUuZy4gYSBIQkEgZGll
cywgdGFraW5nIG91dCBtdWx0aXBsZSBkZXZpY2VzCnNpbXVsdGFuZW91c2x5KSBhcmUgY29tcGxl
dGVseSBhdm9pZGVkLi4uCgpJdCBhbHNvIGF2b2lkcyB0aGUgcHJvYmxlbSBvZiAtPm1hcmtfZGVh
ZCBldmVudHMgYmVpbmcgZ2VuZXJhdGVkCmZyb20gYSBjb250ZXh0IHRoYXQgaG9sZHMgZmlsZXN5
c3RlbS92ZnMgbG9ja3MgYW5kIHRoZW4gZGVhZGxvY2tpbmcKd2FpdGluZyBmb3IgdGhvc2UgbG9j
a3MgdG8gYmUgcmVsZWFzZWQuCgpJT1dzLCBhIG11bHRpLWRldmljZSBmaWxlc3lzdGVtIHNob3Vs
ZCByZWFsbHkgYmUgaW1wbGVtZW50aW5nCi0+bWFya19kZWFkIGl0c2VsZiwgYW5kIHNob3VsZCBu
b3QgYmUgZGVwZW5kaW5nIG9uIGJlaW5nIGFibGUgdG8KbG9jayB0aGUgc3VwZXJibG9jayB0byB0
YWtlIGFuIGFjdGl2ZSByZWZlcmVuY2UgdG8gaXQuCgpJdCBzaG91bGQgYmUgcHJldHR5IGNsZWFy
IHRoYXQgdGhlc2UgYXJlIG5vdCBpc3N1ZXMgdGhhdCB0aGUgZ2VuZXJpYwpmaWxlc3lzdGVtIC0+
bWFya19kZWFkIGltcGxlbWVudGF0aW9uIHNob3VsZCBiZSB0cnlpbmcgdG8KaGFuZGxlLi4uLi4K
Cj4gVGhlIHNodXRkb3duIG1ldGhvZCBpcyBpbXBsZW1lbnRlZCBvbmx5IGJ5IGJsb2NrLWJhc2Vk
IGZpbGVzeXN0ZW1zIGFuZAo+IGFyZ3VhYmx5IHNodXRkb3duIHdhcyBhbHdheXMgYSBtaXNub21l
ciBiZWNhdXNlIGl0IGFzc3VtZWQgdGhhdCB0aGUKPiBmaWxlc3lzdGVtIG5lZWRzIHRvIGFjdHVh
bGx5IHNodXQgZG93biB3aGVuIGl0IGlzIGNhbGxlZC4KClNodXRkb3duIHdhcyBub3QgLWFzc3Vt
ZWQtIGFzIHRoZSBvcGVyYXRpb24gdGhhdCBuZWVkZWQgdG8gYmUKcGVyZm9ybWVkLiBUaGF0IHdh
cyB0aGUgZmVhdHVyZSB0aGF0IHdhcyAqcmVxdWlyZWQqIHRvIGZpeApmaWxlc3lzdGVtIGxldmVs
IHByb2JsZW1zIHRoYXQgb2NjdXIgd2hlbiB0aGUgZGV2aWNlIHVuZGVybmVhdGggaXQKZGlzYXBw
ZWFycy4KCi0+bWFya19kZWFkKCkgaXMgdGhlIGFic3RyYWN0IGZpbGVzeXN0ZW0gbm90aWZpY2F0
aW9uIGZyb20gdGhlIGJsb2NrCmRldmljZSwgZnNfYmRmZXZfbWFya19kZWFkKCkgaXMgdGhlIC1n
ZW5lcmljIGltcGxlbWVudGF0aW9uLSBvZiB0aGUKZnVuY3Rpb25hbGl0eSByZXF1aXJlZCBieSBz
aW5nbGUgYmxvY2sgZGV2aWNlIGZpbGVzeXN0ZW1zLiBQYXJ0IG9mCnRoYXQgZnVuY3Rpb25hbGl0
eSBpcyBzaHV0dGluZyBkb3duIHRoZSBmaWxlc3lzdGVtIGJlY2F1c2UgaXQgY2FuCipubyBsb25n
ZXIgZnVuY3Rpb24gd2l0aG91dCBhIGJhY2tpbmcgZGV2aWNlKi4KCm11bHRpLWJsb2NrIGRldmlj
ZSBmaWxlc3lzdGVtcyByZXF1aXJlIGNvbXBlbHRlbHkgZGlmZmVyZW50CmltcGxlbWVudGF0aW9u
cywgYW5kIHdlIGFscmVhZHkgaGF2ZSBvbmUgdGhhdCAtZG9lcyBub3QgdXNlIGFjdGl2ZQpzdXBl
cmJsb2NrIHJlZmVyZW5jZXMtLiBJT1dzLCBldmVuIGlmIHdlIGFkZCAtPnJlbW92ZV9iZGV2KHNi
KQpjYWxsb3V0LCBiY2FjaGVmcyB3aWxsIGNvbnRpbnVlIHRvIHVzZSAtPm1hcmtfZGVhZCgpIGJl
Y2F1c2UgbG93CmxldmVsIGZpbGVzeXN0ZW0gZGV2aWNlIG1hbmFnZW1lbnQgaXNuJ3QgKGFuZCBz
aG91bGRuJ3QgYmUhKQpkZXBlbmRlbnQgb24gaGlnaCBsZXZlbCBWRlMgc3RydWN0dXJlIHJlZmVy
ZW5jZSBjb3VudGluZy4uLi4KCj4gSU9XLCB3ZSBtYWRlCj4gaXQgc28gdGhhdCBpdCBpcyBhIGNh
bGwgdG8gYWN0aW9uIGJ1dCB0aGF0IGRvZXNuJ3QgaGF2ZSB0byBiZSB0aGUgY2FzZS4KPiBDYWxs
aW5nIGl0IC0+cmVtb3ZlX2JkZXYoKSBpcyBpbW8gdGhlIGNvcnJlY3QgdGhpbmcgYmVjYXVzZSBp
dCBnaXZlcwo+IGJsb2NrIGJhc2VkIGZpbGVzeXN0ZW0gdGhlIGFiaWxpdHkgdG8gaGFuZGxlIGRl
dmljZSBldmVudHMgaG93IHRoZXkgc2VlCj4gZml0LgoKQW5kIHRoYXQncyBleGFjdGx5IHdoYXQg
LT5tYXJrX2RlYWQgYWxyZWFkeSBwcm92aWRlcy4gCgpBbmQsIGFzIEkndmUgcG9pbnRlZCBvdXQg
YWJvdmUsIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyBkb24ndAphY3R1YWxseSBuZWVkIGFjdGl2
ZWx5IHJlZmVyZW5jZWQgc3VwZXJibG9ja3MgdG8gcHJvY2VzcyBkZXZpY2UKcmVtb3ZhbCBub3Rp
ZmljYXRpb25zLiBIZW5jZSAtPm1hcmtfZGVhZCBpcyB0aGUgY29ycmVjdCBpbnRlcmZhY2UKZm9y
IHRoZW0gdG8gdXNlLgoKLURhdmUuCi0tIApEYXZlIENoaW5uZXIKZGF2aWRAZnJvbW9yYml0LmNv
bQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
